class ImagesController < ApplicationController
  def destroy
    image_id = ActiveStorage::Attachment.find_by(:blob_id => params[:id]).id
    ActiveRecord::Base.connection.execute("DELETE FROM active_storage_attachments WHERE id = #{image_id};")
    redirect_to user_album_path(:user_id => params[:user_id], :id => params[:album_id])
  end
end
