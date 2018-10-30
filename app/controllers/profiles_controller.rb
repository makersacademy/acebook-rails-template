# frozen_string_literal: true

# Controller for the comments
class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def create
    @post.comments.create(user_id: current_user.id,
                          comment_text: params[:comment].values.join(''))
    redirect_to post_url(@post)
  end

  def show
@user = User.find(params[:id])
  end


end
