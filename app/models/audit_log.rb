class AuditLog < ActiveRecord::Base
  
  enum status: {pending: 0, confirmed: 1}

  belongs_to :user

  validates :user_id, :start_date, :status, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
  	self.start_date ||= Date.today - 6.days
  end
end
