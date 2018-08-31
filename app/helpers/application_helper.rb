# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      warning: 'alert-warning',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
