class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.where(user_id: current_user.id).find(params[:id])
  end
end
