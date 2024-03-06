class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:name)
  end

  def new
    @pokemon = Pokemon.new
  end

  def show
    @pokemon = Pokemon.find(params[:id])
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
