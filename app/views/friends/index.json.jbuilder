# frozen_string_literal: true

json.array! @friends, partial: 'friends/friend', as: :friend
