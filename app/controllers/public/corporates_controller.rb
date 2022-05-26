class Public::CorporatesController < ApplicationController
  def index
    @corporates = Corporate.page(params[:page])
  end

  def search
    @corporates = if params[:name].present?

                    Corporate.where('name LIKE :param OR phone_number LIKE :param OR name_kana LIKE :param', param: "%#{params[:name]}%").page(params[:page])
                  else
                    Corporate.none.page(params[:page])
                  end
    render :index
  end

  def show
    @corporate = Corporate.find(params[:id])
  end

  private

  def corporate_params
    params.require(:corporate).permit(:name, :name_kana, :annual_saleses, :industories, :employees, :bases, :corporate_info,
                                      :phone_number, :address)
  end
end
