require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  def new
    @user = User.new
  end
end
