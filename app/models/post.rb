class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy

    def editable?
        Time.now.to_i < created_at.since(600).to_i
    end

    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end
end
