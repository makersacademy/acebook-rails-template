class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
# everything after the : are Devise modules 
# each is responsible for a different action from encrypting passwords
# to offering recoverable actions
#https://subscription.packtpub.com/book/application_development/9781782167044/1/ch01lvl1sec08/devise-modules
#full list here
#modules are similar to classes in that they hold methods but instead if being attached to one class
#they can be shared across all classes.

#http://ruby-for-beginners.rubymonstas.org/advanced/modules.html