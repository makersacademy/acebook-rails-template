class ProfileController < ApplicationController
  
  def index
    @photo = ActiveStorage::Blob.find_by(:id => session[:photo_id])
    @user = User.find_by_id(params[:id])
    @posts = Post.all
    @albums = Album.all
  end

  def set_photo
    blob_id = ActiveRecord::Base.connection.execute("SELECT blob_id FROM active_storage_attachments WHERE id = #{params[:id]};")
    session[:photo_id] = blob_id[0]["blob_id"]
    redirect_to profile_index_path(:id => params[:user_id])
  end
end
