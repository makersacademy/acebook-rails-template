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
          user = User.where(email: permitted_params[:email]).first!
          if !user.authenticate(permitted_params[:password])
            raise 'invalid user'
          else
            user
          end
        end
        desc "Create a new user"
        params do
          requires :email, type: String, desc: "email of the new user"
          requires :password, type: String, desc: "password of the new user"
        end
        post "/new" do
          p "here"
          User.create(permitted_params)
        end
      end
    end
  end
end
