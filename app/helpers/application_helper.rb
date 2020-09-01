module ApplicationHelper
  def reload_page
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end
