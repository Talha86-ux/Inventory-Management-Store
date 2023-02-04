# frozen_string_literal: true

class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_items_params)
    if @line_item.save
      redirect_to line_items_path
    else
      flash[:notice] = @line_item.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def line_items_params
    params.require(:line_item).permit(:supplier_id, :price, :quantity, :total_price, :product)
  end

  def action_params
    @product = LineItem.find(params[:id])
  end
end
