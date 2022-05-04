class Public::CorporatesController < ApplicationController
  
  def index
    
    if params[:search] == nil || ''
      @corporates = Corporate.page(params[:page])
    elsif params[:search] == ''
      @corporates = Corporate.page(params[:page])
    else
      @corporates = Corporate.where("body LIKE ?",'%' + params[:search] + '%')
    end
    
  end

  def show
    @corporate = Corporate.find(params[:id])
  end

  private
  def corporate_params
    params.require(:corporate).permit(:name,:name_kana,:annual_saleses,:industories,:employees,:bases,:corporate_info,:phone_number,:address)
  end
end
