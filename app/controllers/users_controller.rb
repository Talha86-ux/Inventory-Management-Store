# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :action_params, only: %i[show edit destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      flash[:notice] = 'cancel'
      render :new
    end
  end

  def edit; end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)

      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def action_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :id, :password)
  end
end
