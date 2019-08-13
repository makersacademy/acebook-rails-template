class Post < ApplicationRecord
    belongs_to :user, required: true
end
