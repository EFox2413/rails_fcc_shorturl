class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def respond_with_errors(object)
      render json: {errors: 'Errors yo'}, status: :unprocessable_entity
  end
end
