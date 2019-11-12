class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def not_editable?
    (Time.now - created_at) > 600
  end

  def can_destroy?
    destroy
  end

end
