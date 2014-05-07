# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  uid               :string(255)
#  provider          :string(255)
#  picture_url       :string(255)
#  picture_large_url :string(255)
#  email             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
	has_many :tasks
	def self.find_by_omni(auth)
		where(auth.slice("uid","provider")).first || create_by_omni(auth)
	end
	
	def self.create_by_omni(auth)
		create! do |user|
			user.uid=auth.uid
			user.provider=auth.provider
			if auth.provider=="vkontakte"
				user.picture_url=auth.info.image
				user.picture_large_url=auth.extra.raw_info.photo_200_orig
				user.name=auth.info.name
			end
			if auth.provider=="developer"
				user.name=auth.info.name
			end
		end
	end	
end
