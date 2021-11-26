class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def update
    p post = Post.find_by(id: id_params)
    p post.increment(:likes)
    post.save
    redirect_to posts_url
  end

  
  private

  def post_params
    params.require(:post).permit(:message)
  end

  def id_params
    params.require(:id)
  end

end

# <%= form_for @post do |form| %>
#   <%= form.label :Comment %>
#   <%= form.text_field :Comment %>
#   <%= form.submit "Post Comment" %>
# <% end %>

# <textarea class="form-control offset-4" id="exampleFormControlTextarea1" rows="4" style="width: 40rem;"></textarea>