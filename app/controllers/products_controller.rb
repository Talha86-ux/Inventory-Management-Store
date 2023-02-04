# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :action_params, only: %i[edit update destroy]
  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to company_products_path
    else
      flash[:notice] = @product.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to company_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to company_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :supplier_id, :quantity, :supplied_by)
  end

  def action_params
    @product = Product.find(params[:id])
  end
end
