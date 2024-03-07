class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR element ILIKE :query"
      @pokemons = Pokemon.where(sql_subquery,  query: "%#{params[:query]}%")
    else
      @pokemons = Pokemon.order(:name)
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
    @pokemon.save
    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:nickname, :age, :rating, :element, :name)
  end
end
