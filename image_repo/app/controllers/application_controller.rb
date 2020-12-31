class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
    before_action :authenticate_user!

    def home
        @user_account = UserAccount.find_by_user_id(current_user.id)
        @user_items = UserItem.where(user_id: 10).to_a
        @user_images = []
        
        @user_items.each do |user_item| 
          store_item = StoreItem.find(user_item[:store_item_id])
          @user_images.push({imgurl: store_item[:imageurl], quantity: user_item[:quantity]})
        end
    end

    protected
    
    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
    end
end
