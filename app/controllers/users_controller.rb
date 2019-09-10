class UsersController < Clearance::UsersController
  # protected
  def url_after_create
    '/posts'
  end
end
