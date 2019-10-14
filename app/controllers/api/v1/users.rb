module API
 module V1
   class Users < Grape::API
     include API::V1::Defaults
     resource :users do
       desc "Return all users"
       get "" do
          User.all
       end
     desc "Return a user from email"
       params do
         requires :email, type: String, desc: "email of the user"
       end
       get ":email" do
         User.where(email: permitted_params[:email]).first!
       end
     end
   end
 end
end
