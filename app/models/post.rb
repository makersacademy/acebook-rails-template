class Post < ApplicationRecord
  belongs_to :user
  acts_as_favoritable
  acts_as_commontable dependent: :destroy

  def toggle_favorite
    @post = Post.find_by(id: params[:id])
    if current_user.favorited?(@post)
      current_user.unfavorite(@post)
    else
      current_user.favorite(@post)
    end
  end

end
