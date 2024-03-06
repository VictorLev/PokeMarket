class RentalsController < ApplicationController
  before_action :set_pokemon, only: %i[new create index]

  def index
    @rentals = Rental.where(pokemon: @pokemon)
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new( **rental_params, pokemon: @pokemon, user: current_user)
    if @rental.save
      redirect_to pokemon_path(@pokemon), notice: 'Rental was successfully created.'
    else
      render partial: "rentals/new", status: :unprocessable_entity, locals: { pokemon: @pokemon }
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to account_path, status: :see_other
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def rental_params
    params.require(:rental).permit(:status, :start_date, :end_date)
  end
end
