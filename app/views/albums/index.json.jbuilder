# frozen_string_literal: true

json.array! @albums, partial: 'albums/album', as: :album
