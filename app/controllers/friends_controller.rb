class FriendsController < ApplicationController
  before_action :set_current_user
  layout "main"

  def index
    @notice=""
    @friends=Exp.where("user_id1=?", @current_user.id)
    if @friends.empty?
      @notice = "У вас нет еще ни одного друга на сервисе!"
    end
  end

end
