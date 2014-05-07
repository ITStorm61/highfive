# == Schema Information
#
# Table name: exps
#
#  id         :integer          not null, primary key
#  user_id1   :integer
#  user_id2   :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Exp < ActiveRecord::Base
end
