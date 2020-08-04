class Post < ApplicationRecord
  validates :message, presence: true,
                    length: { minimum: 1 }
  belongs_to :user
  # validates :is_the_same_message?, on: :update

  # def is_the_same_message?
  #   p message_changed?
  #   if message_changed?
  #     if self.message = Post.find(params[:id]).message
  #       Post.errors[:message] = "Not possible. Message has not been changed"
  #     end
  #   end
  # end

end
