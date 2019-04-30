class PushAuthorIdToRecipientId < ActiveRecord::Migration[5.1]
  def change
    Post.update_all("recipient_id = author_id")
  end
end
