class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?#デバイスの機能が使われる前にconfigure_permitted_parametersが行われる
    def after_sign_in_path_for(resource)
    	user_path(resource.id)
    end


	protected
	def configure_permitted_parameters#nameのデータ操作を許可するアクション
		added_attrs = [ :email, :name, :password, :password_confirmation ]
		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])#ユーザー登録の時にnameのデータ操作をdevise_parameter_sanitizer.permitが行う
	end
end
