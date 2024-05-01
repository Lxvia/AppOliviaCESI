class GossipController < ApplicationController
    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end

    def create
        
    end
end