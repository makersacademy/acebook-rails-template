# frozen_string_literal: true

module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      p 'not stubbing user with posts'
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, scope: :user)
      allow(controller).to receive(:current_user).and_return(nil)
    else
      p 'stubbing user with posts'
      posts = double('posts', build: { message: 'Hello, world!' }, create: { message: 'Hello, world!' })
      allow(user).to receive(:posts).and_return(posts)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)

      allow(controller).to receive(:current_user).and_return(user)

    end
  end
end
