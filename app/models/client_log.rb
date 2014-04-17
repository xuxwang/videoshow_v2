class ClientLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :check_status, type: Boolean
  mount_uploader :client_log, ClientLogUploader
  attr_accessible :client_log, :client_log_cache
  default_scope desc(:"created_at")

    def check!
    self.check_status = true
    self.save
  end

  def cancel!
    self.check_status = false
    self.save
  end
end