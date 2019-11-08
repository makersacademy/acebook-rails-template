class User < ApplicationRecord

  # Include default devise modules. Others available are:
   #:confirmable, :lockable, :timeoutable, :trackable and

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  has_many :posts
  # has_many :posts, dependent: :destroy

  def self.from_onmniauth(auth)
    where(provider: auth.provider, uid: auth.id).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.username
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0, 20]
      #user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
