class Post < ApplicationRecord
  belongs_to :user
  belongs_to :user, foreign_key: 'location_id_fk'
end
