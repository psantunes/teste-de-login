class InsecureUsersController < ApplicationController
  before_action :set_insecure_user, only: %i[ show edit update destroy ]

  # GET /insecure_users or /insecure_users.json
  def index
    @insecure_users = InsecureUser.all

    @teste = InsecureUser.where "id: #{params[:id]}"
    params[:id] = " '0' OR 1=1"
  end

  # GET /insecure_users/1 or /insecure_users/1.json
  def show
  end

  # GET /insecure_users/new
  def new
    @insecure_user = InsecureUser.new
  end

  # GET /insecure_users/1/edit
  def edit
  end

  # GET /insecure_users or /insecure_users.json
  def create
    @insecure_user = InsecureUser.new(insecure_user_params)

    respond_to do |format|
      if @insecure_user.save
        format.html { redirect_to @insecure_user, notice: "Insecure user was successfully created." }
        format.json { render :show, status: :created, location: @insecure_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insecure_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insecure_users/1 or /insecure_users/1.json
  def update
    respond_to do |format|
      if @insecure_user.update(insecure_user_params)
        format.html { redirect_to @insecure_user, notice: "Insecure user was successfully updated." }
        format.json { render :show, status: :ok, location: @insecure_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insecure_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insecure_users/1 or /insecure_users/1.json
  def destroy
    @insecure_user.destroy
    respond_to do |format|
      format.html { redirect_to insecure_users_url, notice: "Insecure user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insecure_user
      @insecure_user = InsecureUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insecure_user_params
      params.require(:insecure_user).permit(:login, :password, :bio)
    end
end
