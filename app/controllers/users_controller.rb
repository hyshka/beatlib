class UsersController < ApplicationController
  #before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.all
  end

  def show
    #@beats = Beat.all
    #@user = User.find(params[:id])
    @user = User.find_by_permalink(params[:permalink])
    @beats = Beat.where(user_id: @user.id)
    @favorites = @user.favorites.where(user_id: @user.id)

    #unless @user == current_user
    #  redirect_to :back, :alert => "Access denied."
    #end
  end

  def new
    @user = User.new
  end

  def edit
    #@user = User.find(params[:id])
    @user = User.find_by_permalink(params[:permalink])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :location, :music_styles, :music_do, :website, :avatar, :permalink, :terms_of_service)
    end

end
