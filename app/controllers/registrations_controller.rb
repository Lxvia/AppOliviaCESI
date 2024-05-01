class RegistrationsController < ApplicationController
    def news
        @user = User.new
    end

    def create
        @city = City.find_or_create_by(city_name: params[:city])
        @user_new = User.new(user_params)
        @user_new.city = @city

        if @user_new.save!
            redirect_to "/login"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email, :description, :age, :password, :password_confirmation)
    end
end