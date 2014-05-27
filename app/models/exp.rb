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
  def self.exists_relationship?(user_id1, user_id2)
    if (Exp.find_by(user_id1: user_id1, user_id2: user_id2) || Exp.find_by(user_id1: user_id2, user_id2: user_id1)).nil?
      return false
    else
      return true
    end
  end

  def self.create_relationship(user_id1, user_id2)
    exp = create! do |exp|
      exp.user_id1 = user_id1
      exp.user_id2 = user_id2
      exp.value = 0
    end
    create! do |exp|
      exp.user_id1 = user_id2
      exp.user_id2 = user_id1
      exp.value = 0
    end
    return exp
  end

  def self.increment(user_id1,user_id2)
    exp = Exp.find_by(user_id1: user_id1, user_id2: user_id2) || Exp.create_relationship(user_id1, user_id2)
    exp.value += 1
    exp.save
  end
end
