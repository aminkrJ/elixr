class AddSmtpCredentialForTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :smtp_username, :string
    add_column :tenants, :smtp_password_digest, :string
  end
end
