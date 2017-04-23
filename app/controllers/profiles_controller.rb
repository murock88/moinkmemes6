class ProfilesController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
        @memes = @user.memes
    end
    
    def index
        @users = User.all
    end

end