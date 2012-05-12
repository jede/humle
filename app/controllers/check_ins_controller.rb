class CheckInsController < ApplicationController
  def create
    @check_in = current_user.check_ins.new(params[:check_in])
    if @check_in.save
      redirect_to [:edit, current_user, @check_in]
    else
      render status: 500
    end
  end

  def show
    @check_in = current_user.check_ins.find(params[:id])
  end

  def edit
    @check_in = current_user.check_ins.find(params[:id])
    redirect_to [current_user, @check_in] if @check_in.rating.present?

    @places = Place.from_foursquare(ll: "#{current_position[:latitude]}, #{current_position[:longitude]}")
  end

  def update
    @check_in = current_user.check_ins.find(params[:id])
    if @check_in.update_attributes(params[:check_in])
      redirect_to [current_user, @check_in]
    else
      render status: 500
    end
  end

end
