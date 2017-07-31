


  class SessionsController < Devise::SessionsController
    respond_to :js,:html,:json
    def new
      
    respond_to do |format|
        format.html{super}
        format.js{}
      end
    end

    # override create method to add additional params for flash message, :username
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in, :username => resource.full_name) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end  
  end

