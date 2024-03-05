class RentalsController < ApplicationController
  def index
    @rentals = Rentals.where(pokemon_id: params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = ental.new( **rental_params, user: current_user)
    @rental.save
    redirect_to  pokemon_rental_index_path
  end

  private

  def rental_params
    params.require(:rental).permit(:staus, :start_date, :end_date)
  end

end
