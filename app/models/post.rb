class Post < ApplicationRecord
  validates :message, presence: true,
                    length: { minimum: 1 }
  belongs_to :user

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
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
