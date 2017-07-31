class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
	  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :remember_me)}
	end

	unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
  end 

  private
  def render_not_found(exception)
    exception_deliver(exception)
    if request.xhr?
      head :no_content, :status => :bad_request
    end
    redirect_to four_zero_four_path
  end

  def render_error(exception)
    exception_deliver(exception)
    if request.xhr?
      head :no_content, :status => :bad_request
    end
    redirect_to four_zero_four_path
  end
  
end
