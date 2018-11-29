# frozen_string_literal: true

module ApplicationHelper
  def user_not_authorised?(item)
    item.user_id != current_user.id
  end

  def not_editable?(item)
    Time.now > (item.updated_at + 10.minutes)
  end
end
