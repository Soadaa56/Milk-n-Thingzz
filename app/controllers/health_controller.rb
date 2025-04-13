class HealthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:up]

  def up
    render json: { status: 'UP' }, status: :ok
  end

  def show
    head :ok
  end
end
