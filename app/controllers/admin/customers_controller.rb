class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to admin_customers_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :password)
  end
end
