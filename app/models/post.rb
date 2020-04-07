class Post < ApplicationRecord

  attr_reader :id, :poster_id, :content, :time

  def initialize(id:, poster_id:, content:, time:)
    @id = id
    @poster_id = poster_id
    @content = content
    @time = time
  end

  def self.create(poster_id:, content:, time:)
    if ENV['RAILS_ENV'] == 'test'
      connect = PG.connect(dbname: "pgapp_test")
    else
      connect = PG.connect(dbname: "pgapp_development")
    end
    result = connect.exec("INSERT INTO posts(poster_id, content, time) VALUES ('#{poster_id}', '#{content}', '#{time}') RETURNING id, poster_id, content, time;")
    Post.new(id: result[0]['id'], poster_id: result[0]['poster_id'], content: result[0]['content'], time: result[0]['time'])
  end
end

