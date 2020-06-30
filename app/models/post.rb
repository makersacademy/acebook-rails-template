class Post < ApplicationRecord
<<<<<<< HEAD
  has_one_attached :file
||||||| 50b89d4
=======
  belongs_to :student, required: false
>>>>>>> master
end
