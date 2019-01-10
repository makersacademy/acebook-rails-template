class FriendsController < ApplicationController
  def search
    if params[:search]
      firstword = params[:search].split(' ').first
      lastword = params[:search].split(' ').last

      @results = User.where(["firstname LIKE ? OR lastname LIKE ?", "#{firstword}", "#{lastword}"])
    end
  end

  def create
    redirect_to profile_page_url(current_user.id)
  end
end
