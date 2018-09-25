module ApplicationHelper
	
	def admin_types
		["AdminUser"]	
	end

	def active?(path)
		#Este método regresa el string "active", que es 
		# lo que el tag de html necesita para funcionar
		"active" if current_page?(path)		
	end

	def status_label(status)
		status_span_generator(status)
	end

	private
	def status_span_generator(status)
		case status
		when 'submitted'
			content_tag(:span, status, class: 'label label-primary')
		when 'approved'
			content_tag(:span, status, class: 'label label-success')
		when 'rejected'	
			content_tag(:span, status, class: 'label label-damger')
		when 'pending'	
			content_tag(:span, status, class: 'label label-primary')
		when 'confirmed'	
			content_tag(:span, status, class: 'label label-success')
		end
	end

end
