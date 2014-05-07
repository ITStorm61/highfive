# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
end
