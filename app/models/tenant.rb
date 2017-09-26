require 'bcrypt'

class Tenant < ActiveRecord::Base
  include BCrypt

  after_create :create_tenant

  def smtp_password
    @smtp_password ||= Password.new(smtp_password_digest)
  end

  def smtp_password=(new_password)
    @smtp_password = Password.create(new_password)
    self.smtp_password_digest = @smtp_password
  end

  private

  def create_tenant
    Apartment::Tenant.create(self.domain)
  end
end
