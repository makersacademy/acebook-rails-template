class ProfilepicturesController < ApplicationController
  before_action :set_profilepicture, only: [:show, :edit, :update, :destroy]

  # GET /profilepictures
  # GET /profilepictures.json
  def index
    @profilepictures = Profilepicture.all
  end

  # GET /profilepictures/1
  # GET /profilepictures/1.json
  def show
  end

  # GET /profilepictures/new
  def new
    @profilepicture = Profilepicture.new
  end

  # GET /profilepictures/1/edit
  def edit
  end

  # POST /profilepictures
  # POST /profilepictures.json
  def create
    @profilepicture = Profilepicture.new(profilepicture_params)
    @profilepicture.user = User.find(session[:current_user])
    respond_to do |format|
      if @profilepicture.save
        format.html { redirect_to '/users/'+ session[:current_user].to_s + '/timeline', notice: 'Profilepicture was successfully created.' }
        format.json { render :show, status: :created, location: @profilepicture }
      else
        format.html { render :new }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profilepictures/1
  # PATCH/PUT /profilepictures/1.json
  def update
    respond_to do |format|
      if @profilepicture.update(profilepicture_params)
        format.html { redirect_to '/users/'+ session[:current_user].to_s + '/timeline', notice: 'Profilepicture was successfully updated.' }
        format.json { render :show, status: :ok, location: @profilepicture }
      else
        format.html { render :edit }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profilepictures/1
  # DELETE /profilepictures/1.json
  def destroy
    @profilepicture.destroy
    respond_to do |format|
      format.html { redirect_to '/users/'+ session[:current_user].to_s + '/timeline', notice: 'Profilepicture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profilepicture
      @profilepicture = Profilepicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profilepicture_params
      params.require(:profilepicture).permit(:caption, :image)
    end
end
