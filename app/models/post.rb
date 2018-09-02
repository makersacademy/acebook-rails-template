# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  delegate :first_name, to: :user, prefix: true #-> @order.first_name
end
