class Admin::CorporatesController < ApplicationController
  def new
    @corporate = Corporate.new
  end

  def create
    @corporate = Corporate.new(corporate_params)
    if @corporate.save
      redirect_to  admin_corporate_path(@corporate.id)
    else
      render :new
    end
  end

  def show
    @corporate = Corporate.find(params[:id])
  end

  def index
    @corporates = Corporate.page(params[:page])
  end

  def edit
    @corporate = Corporate.find(params[:id])
  end

  def update
    corporate = Corporate.find(params[:id])
    corporate.update(corporate_params)
    redirect_to admin_corporate_path(corporate.id)

  end

  private
  def corporate_params
    params.require(:corporate).permit(:name,:name_kana,:annual_saleses,:industories,:employees,:bases,:corporate_info,:phone_number,:address)
  end
end
