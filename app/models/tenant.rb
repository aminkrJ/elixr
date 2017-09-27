class Tenant < ActiveRecord::Base
  after_create :create_tenant

  def self.current
    Tenant.find_by domain: Apartment::Tenant.current
  end

  def smtp_password
    encryptor.decrypt_and_verify(self.smtp_password_digest)
  end

  def smtp_password=(smtp_password_phrase)
    self.smtp_password_digest = encryptor.encrypt_and_sign(smtp_password_phrase)
  end

  private

  def encryptor
    @encryptor ||= ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  end

  def create_tenant
    Apartment::Tenant.create(self.domain)
  end
end
