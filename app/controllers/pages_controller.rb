class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR element ILIKE :query"
      @pokemons = Pokemon.where(sql_subquery,  query: "%#{params[:query]}%")
    else
      @pokemons = Pokemon.where(featured: "true")
    end
  end

  def account
    @user = current_user
    @rentals = @user.rental
  end

  def my_pokemon
    @pokemons = current_user.pokemons
  end

  def my_rentals
    @rentals = current_user.rentals
  end
end
