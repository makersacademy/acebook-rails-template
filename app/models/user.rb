# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :posts
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence: true,
  #                  length: { maximum: 25 }
  # validates :email, presence: true,
  #                   length: { maximum: 49 },
  #                   uniqueness: true
  #
  # validates :password, presence: true,
  #                      length: { maximum: 29 }
end
