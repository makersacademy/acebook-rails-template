class SessionsController < ApplicationController
    def create
        @user = params
        p @user['Password']
    end

    def index

    end
end
