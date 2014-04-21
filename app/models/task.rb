class Task < ActiveRecord::Base
    belongs_to :user
    
    validates :description, :cookie, :presence => true
end
