class WebHooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:receive]

  def receive
    provider = params[:provider]
    payload = request.body.read

    ProcessWebhookJob.perform_later(provider, payload)

    render json: { status: 'success' }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def verify_signature!
    nil
  end
end