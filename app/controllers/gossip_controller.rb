class GossipController < ApplicationController
    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.new(user: current_user, title: params[:title], content: params[:content])

        if @gossip.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        
        @gossip = Gossip.find(params[:id])

        if current_user != @gossip.user
            redirect_to :root
        end
    end

    def update

        @gossip = Gossip.find(params[:id])

        post_params = params.require(:gossip).permit(:title, :content)

        if @gossip.update(post_params)
            redirect_to gossip_path(@gossip)
            flash[:succes] = "Gossip updated !"
        else 
            render :edit
            flash[:danger] = "Gossip not updated" 
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to root_path
    end
end