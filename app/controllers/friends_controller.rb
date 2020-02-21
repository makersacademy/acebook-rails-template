# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :set_friend, only: %i[show edit update destroy]
  before_action :authenticate_user

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.order(updated_at: :asc)
  end

  # GET /friends/1
  # GET /friends/1.json
  def show; end

  # GET /friends/new
  def new
    @friend = Friend.new
    @user_friend = User.find(params[:format])
  end

  # GET /friends/1/edit
  def edit; end

  # POST /friends
  # POST /friends.json
  def create
    p = params['friend']['recipient_friend_id']
    c = @current_user.id
    @friend = Friend.new(friend_id: c, recipient_friend_id: p, confirmed_status: false)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to posts_url, notice: 'Friend Request sent.' }
      else
        format.html { redirect_to posts_url, notice: 'Friend Request already sent.' }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully deleted.' }
    end
  end

  def confirm
    @friend = Friend.find_by(id: params[:id])
    @friend.update(confirmed_status: true)
    redirect_to friends_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = Friend.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friend_params
    params.require(:friend).permit(:confirmed_status)
  end
end
