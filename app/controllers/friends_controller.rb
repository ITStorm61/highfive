class FriendsController < ApplicationController
    before_action :set_current_user

    def index

        @friends=Exp.where("user_id1=?", @current_user.id)
        
    end

end
