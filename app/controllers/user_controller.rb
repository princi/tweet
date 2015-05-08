class UserController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for Products!"
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    @products = Product.new
  end


  def show
    @user = User.find(params[:id])
    @product = Product.new
    @relationship = Relationship.where(
      rate_id: current_user.id,
      unrate_id: @user.id
      ).first_or_initialize if current_user
  end


  def edit
    @user = User.find(params[:id])
    redirect_to @user unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "Profile updated!"
    else
       render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :username, :passsword, :password)
  end

end

