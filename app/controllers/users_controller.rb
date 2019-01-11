class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friend = Struct.new(:firstname, :lastname)
    @friends = [@friend.new('Jim', 'Smith'), @friend.new('Anna', 'Blake'), @friend.new('Tom', 'Thumb'), @friend.new('Mark', 'Bolan'),
                @friend.new('Darth', 'Vader'), @friend.new('Bill', 'Tomson'),
                @friend.new('Greg', 'Jones')]
  end
end
