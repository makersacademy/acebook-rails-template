module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc "Return a user from email"
        params do
          requires :email, type: String, desc: "email of the user"
          requires :password, type: String, desc: "password of the new user"
        end
        post "" do
          @user = User.find_by(email: params[:email])
          if @user && @user.authenticate(permitted_params[:password])
            return @user
          elsif !@user
            raise 'invalid user'
          else
            raise "invalid password"
          end
        end
        desc "Create a new user"
        params do
          requires :email, type: String, desc: "email of the new user"
          requires :password, type: String, desc: "password of the new user"
        end
        post "/new" do
          User.create(permitted_params)
        end
      end
    end
  end
end
