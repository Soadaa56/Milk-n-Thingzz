class Admin::OrdersController < ApplicationController
  before_action :check_if_admin?

  def index
    @orders = Order.all
    @paid = @orders.where(status: :paid)
    @processing = @orders.where(status: :processing)
    @fulfilled = @orders.where(status: :fulfilled)
    @cancelled = @orders.where(status: :cencelled)
    @pending = @orders.where(status: :pending)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def check_if_admin?
    redirect_to root_path unless current_user&.admin?
  end
end
