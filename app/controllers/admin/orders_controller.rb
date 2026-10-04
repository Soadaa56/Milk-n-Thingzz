class Admin::OrdersController < ApplicationController
  before_action :check_if_admin?

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def check_if_admin?
    redirect_to root_path unless current_user&.admin?
  end
end
