require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let(:first_tenant) { create :tenant, domain: "first_domain" }
  let(:second_tenant) { create :tenant, domain: "second_domain" }

  it "multi tenancy works" do
    Apartment::Tenant.switch!(first_tenant.domain)
    create :product
    create :product
    expect(Product.count).to eq(2)

    Apartment::Tenant.switch!(second_tenant.domain)
    create :product
    expect(Product.count).to eq(1)
  end

  it "stores encrypted smtp password" do
    tenant = create :tenant, domain: "domain", smtp_username: "test@test.com", smtp_password: "testPassword"

    tenant_password = BCrypt::Password.new(tenant.smtp_password_digest)
    expect(tenant_password).to eq("testPassword")
  end
end



