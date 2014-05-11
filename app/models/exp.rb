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
    def self.update_relationship!(user_id1,user_id2)
        exp = Exp.find_by(user_id1: user_id1, user_id2: user_id2)
        if exp==nil
            Exp.create_relationship!(user_id1,user_id2)
        else
            exp.value += 1
            exp.save
        end
    end

    private
    def self.create_relationship!(user_id1,user_id2)
        create! do |exp|
            exp.user_id1 = user_id1
            exp.user_id2 = user_id2
            exp.value = 1
        end

        create! do |exp|
            exp.user_id1 = user_id2
            exp.user_id2 = user_id1
            exp.value = 0
        end
    end
end
