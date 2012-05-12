class CheckInsController < ApplicationController
  def create
    @check_in = current_user.check_ins.new(params[:check_in])
    if @check_in.save
      redirect_to [current_user, @check_in]
    else
      render status: 500
    end
  end

  def show
    @check_in = current_user.check_ins.find(params[:id])
  end


end
