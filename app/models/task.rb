# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :text
#  cookie      :text
#  deadline    :datetime
#  slave_id    :integer
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
    belongs_to :user
    
    validates :description, :cookie, :presence => true
end
