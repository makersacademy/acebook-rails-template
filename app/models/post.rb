class Post < ApplicationRecord

    # belongs_to :user
    #  attr_reader :created_at, :persisted

    def editable?
        Time.now.to_i < created_at.since(600).to_i
    end
end
