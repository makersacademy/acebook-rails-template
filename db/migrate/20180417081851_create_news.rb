# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news, &:timestamps
  end
end
