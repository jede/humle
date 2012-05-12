class BeersController < ApplicationController
  def search
    @beers = Beer.fulltext_search(params[:query])
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
