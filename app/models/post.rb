# frozen_string_literal: true

class Post < ApplicationRecord

acts_as_votable

def self.getPostsDesc()
  self.find_by_sql("SELECT * FROM posts ORDER BY created_at desc")
end

def self.getPostsAsc()
  self.find_by_sql("SELECT * FROM posts ORDER BY created_at asc")
end

end
