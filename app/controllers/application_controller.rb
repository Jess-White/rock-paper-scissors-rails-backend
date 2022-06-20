class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :handle_unauthorized
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
  
  protect_from_forgery with: :null_session

  def handle_unauthorized(exception)
    render status: 401, json: { errors: ["Unauthorized"] }
  end

  def handle_record_invalid(exception)
    render status: 422, json: { errors: exception.record.errors.full_messages }
  end
end
