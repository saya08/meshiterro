class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #devise(ログインやユーザ登録が実装できるライブラリ)を利用する機能の場合、
  #configure_permitted_parametersを実行する。
  #それが実行されるとユーザ登録の際、ユーザ名のデータ操作が許可される
  before_action :configure_permitted_parameters, if: :devise_controller?
#ログイン認証が成功していない場合、アクセスされた全てをログイン画面へリダイレクトする
  # before_action :authenticate_user!#ログイン認証されていなければrootパスへリダイレクトする
  protected

#configure_permiteddo_parametersが実行されると
#devise_parameter_sanitizer.permitで
#nameのデータ操作を許可するアクションメソッドを指定する。
#今回の場合、ユーザ登録(sign_up)の際、
#ユーザ名(name)のデータ操作が許可されることになる。
#つまり、セキュリティ上の問題を防ぐために用意された仕組みのストロングパラメータである。
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
