class UsersController < ApplicationController

  def show
    
  end

  def edit
  end


  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
