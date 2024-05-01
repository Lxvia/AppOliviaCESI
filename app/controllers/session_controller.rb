class SessionController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
            
        else 
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end

    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    def new
       
    end
end