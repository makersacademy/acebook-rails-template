class UserSignInController < ApplicationController
  before_action :authenticate_user!

end
