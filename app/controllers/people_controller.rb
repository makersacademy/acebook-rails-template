class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json

  def show 
    @people = Person.find(params[:id])
    @followers = @people.followers
    @followees = @people.followees
    @not_following = @people.not_following
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit 
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    # respond_to do |format|
    #   if @person.save
    #     format.html { redirect_to @person, notice: 'Person was successfully created.' }
    #     format.json { render :show, status: :created, location: @person }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @person.errors, status: :unprocessable_entity }
    #   end
    # end
    
  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
        p person_params
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

    @person = Person.find(params[:id])
    # byebug
    Person.find_by(email: params[:person][:email]).followers << @person
    redirect_to "/people/#{@person.id}"

    # respond_to do |format|
    #   if @person.update(person_params)
    #     format.html { redirect_to @person, notice: 'Person was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @person }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @person.errors, status: :unprocessable_entity }
    #   end
    # end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:email, :password, :username)
  end
 end
