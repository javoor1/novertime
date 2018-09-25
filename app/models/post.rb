class Post < ActiveRecord::Base
	enum status: {submitted: 0, approved: 1, rejected: 2}
	belongs_to :user
	validates :date, :rationale, :overtime_request, presence: true
	validates :overtime_request, numericality: { greater_than: 0.0 }

	scope :posts_by, ->(user) { where(user_id: user.id) }

	after_save :update_audit_log


	private
	def update_audit_log
		audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
		p audit_log.inspect
		# audit_log.confirmed!
		# audit_log.destroy #Qué conviene destruir o confirmar?
	end

end