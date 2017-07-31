class ErrorsController <  ApplicationController
  # POST /resource/confirmation
  skip_before_filter :authenticate_user!
  def error_404
  end
end
