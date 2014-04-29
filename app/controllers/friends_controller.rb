class FriendsController < ApplicationController
    before_action :set_current_user

    def index

        for ex in Exp.where("user_id1=?", @current_user.id)
            friends_ids = ex.user_id2
        end

        #необходимо получить список пользователей-друзей
        @friends=User.all #для теста
        
    end

end
