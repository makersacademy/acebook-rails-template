class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validate :age_must_be_over_13

  private

  def age_must_be_over_13
    errors.add(:base, 'Age must be over 13 to join') unless isAgeOver13
  end
       
end
