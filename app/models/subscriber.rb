class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, confirmation: {case_sensitive: false}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  after_create :send_email

  def send_email
    if subscribed_to == "program1"
      #TODO server needs Sidekiq, Resque, etc for safely send emails
      SubscriberMailer.download_pdf(self).deliver_later
    end
  end
end
