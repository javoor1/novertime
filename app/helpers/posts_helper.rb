module PostsHelper
	def status_label(status)
		status_span_generator(status)
	end

	#Esto lo movimos al application helper porque lo necesitamos en auditlog y también funciona, entonces más general.
	# private
	# def status_span_generator(status)
	# 	case status
	# 	when 'submitted'
	# 		content_tag(:span, status, class: 'label label-primary')
	# 	when 'approved'
	# 		content_tag(:span, status, class: 'label label-success')
	# 	when 'rejected'	
	# 		content_tag(:span, status, class: 'label label-damger')
	# 	end
	# end
end
