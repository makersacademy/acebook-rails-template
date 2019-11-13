class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  acts_as_votable

  def not_editable?
    (Time.now - created_at) > 600
  end

  def can_destroy?
    destroy
  end

end
