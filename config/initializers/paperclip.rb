Paperclip::Attachment.default_options[:s3_host_name] = 's3-ap-southeast-2.amazonaws.com'

Paperclip.interpolates :tenant_name do |attachment, style|
  Apartment::Tenant.current
end
