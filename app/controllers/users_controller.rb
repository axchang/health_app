class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :new]     
      

  def index
    @users = User.all
    create_needs_hash
  end

  def new
   @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:username, :org_name, :location, :specialty)
  end

  def create_needs_hash
    @needs_hash = {}
    Need.all.each do |t|
      @needs_hash[t.id] = t.need_type
    end
  end

end