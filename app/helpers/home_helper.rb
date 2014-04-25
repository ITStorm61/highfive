module HomeHelper
	def login_path
		return Rails.env.development? ? "/auth/developer" : "/auth/vkontakte"
	end
end
