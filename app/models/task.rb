class Task < ActiveRecord::Base
    belongs_to :user
    
    validates :description, :cookie, :deadline, presence: true
end
