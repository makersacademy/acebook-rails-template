class Post < ApplicationRecord

  def editable?
    Time.now - self.created_at < 10.seconds
  end

  # def validate_is_editable
  #   if self.persisted? && !self.editable?
  #     self.errors[:editable] << "can edit in just 10 minutes after creation"
  #   end
  # end

end
