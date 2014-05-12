class FriendsController < ApplicationController
    before_action :set_current_user

    def index
        @notice=""
        @friends=Exp.where("user_id1=?", @current_user.id)
        if @friends.count==0
            @notice = "Empty friend list!"
        end
    end

    def self.inc_exp(id1,id2)
        Exp.update_relationship!(id1,id2)
    end

end
