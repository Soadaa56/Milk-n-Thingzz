class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

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
    @user = @order.user
  end

  private

  def require_admin
    return if current_user.admin?
    redirect_to root_url, alert: 'Unauthorized request'
  end
end
