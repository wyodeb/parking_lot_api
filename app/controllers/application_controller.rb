class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotUnique, with: :render_conflict

  private
  def render_unprocessable_entity(error)
    render json: { errors: error.message }, status: :unprocessable_entity
  end

  def render_conflict(_error)
    render json: { error: "Barcode conflict, please retry" }, status: :conflict
  end
end
