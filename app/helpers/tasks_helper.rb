# coding: utf-8
module TasksHelper

	# def control_buttons(user, task)
	# 	if task.user_id==user.id
	# 	 #  мои задания
	# 		case task.status
	# 		when "new"
	# 				#return link_to("Поделиться", "#share", onclick: "$('div#share_bar').css('visibility', 'visible');", class:"btn light-btn") + "  " +
	# 				 return link_to("Удалить", task_path(task), method:"delete" , class:"btn light-btn", confirm: "Вы уверены?")
	# 		when "in_progress"
	# 			return  link_to("Завершить", task_update_status_path(@task, 1) , method: "put", class:"btn no-btn", confirm: "Вы уверены?")
	# 		end
	# 	else
	# 		# чужие задания
	# 		case task.status
	# 		when "new"
	# 			return link_to("Принять", task_update_status_path(@task, 0), method: "put", class:"btn yes-btn") + "  " +
	# 			  link_to("Отказаться", tasks_path(@task, 0) , class:"btn no-btn", confirm: "Вы уверены?")

	# 		when "in_progress"
	# 			return link_to("Готово", task_update_status_path(@task, 0), method: "put", class:"btn done-btn",confirm: "Уверены? Вы не сможете отменить это действие.") + "  " +
	# 			  link_to("Отменить", task_update_status_path(@task, 1) , method: "put", class:"btn no-btn", confirm: "Вы уверены?")
	# 		end
	# 	end
	# end

	def timeago(time, options = {})
		options[:class] ||= "timeago"
		content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
	end


end
