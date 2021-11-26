class articleController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
end 