# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe PostsController, type: :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "signed in user" do
    before :each do
      # This simulates an authenticated user
      login_with create(:user)
    end

    it "should let a user see all the posts" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Standard user" do
    it "can only delete their own posts" do
      # This simulates an authenticated user
      standard_user = create(:user)
      login_with standard_user
      newpost = Post.create(message: 'Console test', user_id: standard_user.id)
      should be_able_to(:destroy, newpost)
      should_not be_able_to(:destroy, Post.create(message: 'Anonomous test'))
    end
  end

  describe "Super user" do
    it "can delete anybody's posts" do
      # This simulates an authenticated user
      superadmin_user = create(:user)
      superadmin_user.superadmin_role = true
      login_with superadmin_user
      newpost = Post.create(message: 'Console test', user_id: superadmin_user.id)
      should be_able_to(:destroy, newpost)
      should be_able_to(:destroy, Post.create(message: 'Anonomous test'))
    end
  end
end
