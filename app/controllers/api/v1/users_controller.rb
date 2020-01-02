class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]
  before_action :find_user, only: [:show, :update, :destroy]

  # TODO: This is just for dev purposes
  def index
    render json: UserSerializer.new(User.all)
  end

  # TODO: This is just for dev purposes
  def show
    render json: UserSerializer.new(@user)
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      # make JWT
      @token = encode_token({ user_id: @user.id })
      # make empty cart/order
      Order.create(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      render json: UserSerializer.new(@user)
    else
      render json: { error: 'failed to update user' }, status: :not_acceptable
    end
  end

  def destroy
    @user.destroy
    render json: { success: true, message: 'user deleted' }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end
end
