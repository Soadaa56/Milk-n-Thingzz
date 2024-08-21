class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_subtypes

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
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
