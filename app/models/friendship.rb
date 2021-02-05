class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  def accept
    update(status: true)
  end

  def decline
    update(status: false)
  end

end
