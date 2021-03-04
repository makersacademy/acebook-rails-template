# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :profile_posts

  extend FriendlyId
  friendly_id :username, use: :slugged

 # match "/users/:username" => "users#show"
 # match '/:id', :to => "users#show", :as => :user, :via => :get

end
