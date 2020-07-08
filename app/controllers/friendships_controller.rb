class FriendshipsController < ApplicationController
  def index
  # pull data from database
  params[:id] = session[:user_id]
  @current_user = User.find_by(id:  session[:user_id])  #current user set from session id. 
  
  end

  def create
    hash = { 'user_id' => 57 , 'friend_id' => 58 , 'confirmed' => TRUE   }
    hash2 = { 'user_id' => 58 , 'friend_id' => 57 , 'confirmed' => TRUE   }
     @friends = Friendship.create(hash)
     @friends_inverse = Friendship.create(hash2)
    p @friends.save
    p @friends.errors.full_messages
    redirect_to posts_path
  end

end
