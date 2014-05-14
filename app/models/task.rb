# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  token       :text
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
    
    belongs_to :slave, :class_name => 'User', :foreign_key => 'slave_id'
    
    validates :description, :cookie, :presence => true
    
    after_create :generate_token

    def to_param
      token
    end 



  private

  def generate_token

    self.token = loop do
      random_token = SecureRandom.hex(4).encode("UTF-8")
      #random_token = Digest::SHA1.hexdigest(Time.now.to_s + self.id.to_s).encode("UTF-8")
      break random_token unless Task.exists?(token: random_token)
    end

    self.save

  end

end
