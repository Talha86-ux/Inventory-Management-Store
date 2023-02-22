# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    if user_signed_in?
      @companies = current_user.role == 'Admin' ? Company.all : Company.where(assign_manager: current_user.id)
      Company.all
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      flash[:notice] = @company.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :business_domain, :user_id, :assign_manager)
  end
end
