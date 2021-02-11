class AddAttachmentPostImgToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :posts, :post_img
  end
end
