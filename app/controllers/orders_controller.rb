class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create,:inquire_enterprise]

  before_action :action_params, only:[:edit, :update, :destroy]
  def index
    @orders = Order.all

  end

  def show
  end

  def new
    @order = Order.new
    @order.line_items.build
  end

  def create
    @order = Order.new (order_params)
    if @order.save
      redirect_to orders_path
    else
      flash[:notice] = @order.errors.full_messages
      render :new
    end

  end

  def edit
    @order.line_items.build
  end

  def update
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end
  private
  def action_params
    @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:company_name, :customer_id, :customer_list, :invoice_no, :invoice_date, :tax, line_items_attributes: [:price, :quantity, :total_price, :order_id, :product_id, :product, :id, :_destroy])
  end
end
