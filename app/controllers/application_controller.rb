# deviseにストロングパラメーターを設定するときは特別な記述が必要
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # sign_upに対して、nicknameというキーのパラメーターを新たに許可します
  def configure_permitted_parameters # 慣習的にこのメソッド名で定義することが多い
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end