class PositionController < ApplicationController
  def change
    session[:current_position] = {
      accuracy: params[:accuracy],
      latitude: params[:latitude],
      longitude: params[:longitude]
    }
    render :text => current_position
  end
end
