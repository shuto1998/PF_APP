class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    # reset_session
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to admin_customers_path
  end

  def index
    @customers = Customer.page(params[:page])
  end

  def search
    @customers = if params[:name].present?

                   Customer.where('name LIKE ?', "%#{params[:name]}%").page(params[:page])
                 else
                   Customer.none.page(params[:page])
                 end
    render :index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to admin_customers_path(@customer.id)
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    puts customer.valid?
    puts customer.invalid?
    redirect_to admin_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :password, :name, :name_kana, :address, :telephone_number,:is_deleted)
  end
end
