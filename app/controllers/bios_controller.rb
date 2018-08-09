class BiosController < ApplicationController

  # GET users/1/bios/new
  def new
  end

  # POST users/1/bios
  def create
    @bio = Bio.new(post_params)
  end

  # GET users/1/bios/1
  def show
  end

  # PATCH/PUT users/1/bios/1
  def update
  end

  # DELETE users/1/bios/1
  def destroy
  end

  private

  def post_params
      params.require(:post).permit(:image, :summary, :user_id)
    end

end
