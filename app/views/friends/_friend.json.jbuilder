# frozen_string_literal: true

json.extract! friend, :id, :confirmed_status, :created_at, :updated_at
json.url friend_url(friend, format: :json)
