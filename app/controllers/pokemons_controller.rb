class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR element ILIKE :query"
      @pokemons = Pokemon.where(sql_subquery,  query: "%#{params[:query]}%")
    else
      @pokemons = Pokemon.order(:name)
    end
    @markers = @pokemons.geocoded.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pokemon: pokemon}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @pokemon = Pokemon.new
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @rental = Rental.new
    @rentals = Rental.where(pokemon: @pokemon)
  end

  def create
    @pokemon = Pokemon.new( **pokemon_params, user: current_user)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon), notice: "Pokemon successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:nickname, :age, :rating, :element, :name, :photo)
  end
end
