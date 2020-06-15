# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagePostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/image_posts').to route_to('image_posts#index')
    end

    it 'routes to #new' do
      expect(get: '/image_posts/new').to route_to('image_posts#new')
    end

    it 'routes to #show' do
      expect(get: '/image_posts/1').to route_to('image_posts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/image_posts/1/edit').to route_to('image_posts#edit',
                                                     id: '1')
    end

    it 'routes to #create' do
      expect(post: '/image_posts').to route_to('image_posts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/image_posts/1').to route_to('image_posts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/image_posts/1').to route_to('image_posts#update',
                                                  id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/image_posts/1').to route_to('image_posts#destroy',
                                                   id: '1')
    end
  end
end
