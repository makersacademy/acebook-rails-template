class MySessionsController < Devise::SessionsController

    def destroy
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        set_flash_message! :notice, :signed_out if signed_out
        yield if block_given?
        respond_to_on_destroy
        redirect_to login_path
      end

    end