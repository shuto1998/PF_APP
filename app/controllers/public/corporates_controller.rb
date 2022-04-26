class Public::CorporatesController < ApplicationController
  def index
    @corporates = Corporate.all
  end

  def show
    @corporate = Corporate.find(params[:id])
  end
  
  private
  def corporate_params
    params.require(:corporate).permit(:name,:name_kana,:annual_saleses,:industories,:employees,:bases,:corporate_info,:phone_number,:address)
  end
end
