class UsersController < ApplicationController
  
  #プロフィールページ
  def show
    @user = User.find_by(id: params[:id]) 
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end
