class StaticPagesController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def author
    @author = User.find_by(first_name:params[:first_name])
  end
end
