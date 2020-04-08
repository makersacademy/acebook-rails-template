class Comment < ApplicationRecord
    validates :body, presence: true,
                    length: { minumum 1 }

    belongs_to :post
    belongs_to :user
end