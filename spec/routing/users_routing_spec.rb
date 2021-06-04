require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #new' do
      expect(get: 'users/signup').to route_to('users#new')
    end

    it 'routes to #signin' do
      expect(get: 'users/signin').to route_to('users#signin')
    end

    it 'routes to #start_user_session' do
      expect(post: 'users/signin').to route_to('users#start_user_session')
    end

    it 'routes to #end_user_session' do
      expect(get: 'users/logout').to route_to('users#end_user_session')
    end

    it 'routes to #top_writer' do
      expect(get: '/top_writer').to route_to('users#top_writer')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users').to route_to('users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1').to route_to('users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1').to route_to('users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1').to route_to('users#destroy', id: '1')
    end
  end
end
