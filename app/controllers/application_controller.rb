class ApplicationController < ActionController::Base
  helper_method :current_cart, :cart_item_count
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_subtypes

  def current_cart
    if current_user
      current_user.cart || current_user.create_cart
    else
      Cart.find_by(id: session[cart_id]) ||
      Cart.create.tap { |cart| session[:cart_id] = cart.id }
    end
  end

  def cart_item_count
    @current_item_count || current_cart.item_count
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def set_subtypes
    @earring_subtypes = Rails.cache.fetch('earring_subtypes', expires_in: 12.hours) do
      Craft.where(category: "Earring").pluck(:subtype).uniq
    end
  end
end
