class SearchController < ApplicationController

  def search
    @pokemons = Pokemon.all
    if params[:query].present?
      @results = PGSearch.multisearch(params[:query])
    else
      @results = PGSearch::Document.all
    end
  end

end
