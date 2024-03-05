class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pokemons = Pokemon.first(10)
  end

  def account
    @user = current_user
    @rentals = @user.rental
  end
end
