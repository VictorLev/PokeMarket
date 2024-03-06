class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @pokemons = Pokemon.where("name LIKE ?", "%#{params[:query][:name]}%")
    else
      @pokemons = Pokemon.where(featured: "true")
    end
  end

  def account
    @user = current_user
    @rentals = @user.rental
  end
end
