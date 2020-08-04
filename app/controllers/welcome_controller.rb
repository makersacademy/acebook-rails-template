class WelcomeController < ApplicationController
  before_action :authenticate_person!
  skip_before_action :verify_authenticity_token

  def index
  end
end
