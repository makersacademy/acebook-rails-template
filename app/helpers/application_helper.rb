module ApplicationHelper
  def reload_page
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js { render inline: 'location.reload();' }
    end
  end
end