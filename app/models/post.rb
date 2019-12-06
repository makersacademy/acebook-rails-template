class Post < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user, foreign_key: :user_id
=======
  belongs_to :user, :foreign_key => 'user_id'
>>>>>>> e3b3cbf51fb14e235f0b3de054d8711cdc5e8a54
end
