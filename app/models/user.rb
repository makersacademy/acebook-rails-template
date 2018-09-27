class User < ApplicationRecord

  validates :full_name, presence: true

end
