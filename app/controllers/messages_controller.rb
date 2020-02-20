class MessagesController < ApplicationController
  skip_before_action :authenticated_user

  def create
  end
end
