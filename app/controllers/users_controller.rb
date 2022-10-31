class UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[show edit update destroy]

  # retrieve the user's data from the database using the session hash
  def show
    @user = User.find_by(id: session[:user_id])
    if @user
      render json: @user
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Please check your email for confirmation'
    else
      render :new, status: unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
