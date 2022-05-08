class Public::CorporatesController < ApplicationController

  def index
      @corporates = Corporate.page(params[:page])
  end

  def search
    if params[:name].present?
    
       @corporates = Corporate.where('name LIKE ?',"%#{params[:name]}%").page(params[:page])
    else
      @corporates = Corporate.none.page(params[:page])
    end
    render :index

  end

  def show
    @corporate = Corporate.find(params[:id])
  end

  private
  def corporate_params
    params.require(:corporate).permit(:name,:name_kana,:annual_saleses,:industories,:employees,:bases,:corporate_info,:phone_number,:address)
  end
end
