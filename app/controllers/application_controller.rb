class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_items

 def new_items
  @newitem = Item.order(created_at: :desc).limit(5)
 end


  def after_sign_in_path_for(resource)
    users_mypage_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
