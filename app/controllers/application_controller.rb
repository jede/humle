class ApplicationController < ActionController::Base
  helper_method :current_position
  protect_from_forgery

  def current_position
    session[:current_position] || {latitude: '59.317546', longitude: '18.064098'}
  end
end
