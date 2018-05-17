# frozen_string_literal: true

# classism
module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(
        :warden,
        scope: :user
      )
      allow(controller).to receive(:current_user).and_return(nil)
    else
      posts = double(
        'posts',
        build: { message: 'Hello, world!' },
        create: { message: 'Hello, world!' }
      )
      allow(user).to receive(:posts).and_return(posts)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)

      allow(controller).to receive(:current_user).and_return(user)

    end
  end
end
