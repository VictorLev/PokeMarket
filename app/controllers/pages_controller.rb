class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # '/search?name="bulbasaur"'
    # params[:query] = { name: “bulbasaur” }
    # @pokemons = Pokemon.where(params[:query])
    if params[:query].present?
      @pokemons = Pokemon.where("name LIKE ?“, "%{params[:query][:name]}%" )"
    else
      @pokemons = Pokemon.all
    end
  end
end
