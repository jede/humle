class BeersController < ApplicationController
  def search
    @beers = Beer.fulltext_search(params[:query])
  end
end
