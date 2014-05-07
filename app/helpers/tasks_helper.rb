module TasksHelper

	def control_buttons(user, task)
		if task.user_id==user.id
		 #  мои задания
			case task.status
			when "new"
					return link_to("Share", task_share_path(task), class:"btn light-btn") + link_to("Delete", task_path(task), method:"delete" , class:"btn light-btn", confirm: "Are u sure?")
			end
		else
			# чужие задания
			case task.status
			when "new"
				return link_to("Yep", task_update_status_path(@task, 0), method: "put", class:"btn light-btn") + 
				  link_to("Nope", tasks_path(@task, 0) , class:"btn light-btn", confirm: "Are u sure?")
			end
		end
	end
end
