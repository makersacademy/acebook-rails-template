# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/friends').to route_to('friends#index')
    end

    it 'routes to #new' do
      expect(get: '/friends/new').to route_to('friends#new')
    end

    it 'routes to #show' do
      expect(get: '/friends/1').to route_to('friends#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/friends/1/edit').to route_to('friends#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/friends').to route_to('friends#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/friends/1').to route_to('friends#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/friends/1').to route_to('friends#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/friends/1').to route_to('friends#destroy', id: '1')
    end
  end
end
