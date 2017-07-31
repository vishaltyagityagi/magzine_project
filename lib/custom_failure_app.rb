class CustomFailureApp < Devise::FailureApp
  def redirect_url
    if request.xhr?
      #send(:"/auth/users/sign_in", :format => :js)
      "/users/sign_in.js"
    else
      super
    end
  end
end