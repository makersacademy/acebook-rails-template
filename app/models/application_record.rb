class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def editable?
    Time.now - self.created_at < 10.minutes
  end

  def validate_is_editable
    if self.persisted? && !self.editable?
      self.errors[:editable] << "can edit in just 10 minutes after creation"
    end
  end


end
