class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pokemons = Pokemon.where(featured: "true")
  end

  def account
    @user = current_user
    @rentals = @user.rental
  end
end
