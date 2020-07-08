class ImagesController < ApplicationController
  def destroy
    image_id = ActiveStorage::Attachment.find_by(record_id: params[:id]).id
    @image = ActiveStorage::Blob.find(image_id)
    @image.destroy
    redirect_to profile_index_path(:id => params[:user_id])
  end
end
