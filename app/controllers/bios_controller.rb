class BiosController < ApplicationController
  before_action :set_bio, only: [:show, :edit, :update, :destroy]


  def index
    @bios = Bio.all
  end


  def show
  end

  def new
    @bio = Bio.new
  end

  def edit
  end

  def create
    @bio = Bio.create({age: params[:bio][:age], bio: params[:bio][:bio], location: params[:bio][:location], bio_username: params[:bio][:bio_username]})
    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bio
      @bio = Bio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bio_params
      params.require(:bio).permit(:id, :age, :bio, :location)
    end
end
