# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  # Code for Paperclip to use avatar profile pics for users - add image file
  # to db :avatar and links to /public/images/ under medium or thumb directories
  has_attached_file :avatar, styles: { medium: '250x250>', thumb: '100x100#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"]
end
