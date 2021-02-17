class SubscribeController < ApplicationController
  before_action :find_post
  before_action :find_subscribe, only: [:destroy]

  def create
    if already_subscribed?
      flash[:notice] = "You can't subscribe more than once"
    else
      @post.subscribe.create(user_id: current_user.id)
    end
    redirect_back fallback_location: root_path #may need to change redirect
  end

  def destroy
    if !(already_subscribed?)
      flash[:notice] = "Cannot unsubscribe"
    else
      @subscribe.destroy
    end
    redirect_back fallback_location: root_path #may need to change redirect
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_subscribe
    @subscribe = Subscribe.find(params[:id])
  end

  def already_subscribed?
    Subscribe.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
