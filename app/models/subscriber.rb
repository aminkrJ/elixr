class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, confirmation: { case_sensitive: false }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  after_save :send_email

  # subscribed_to is the program a prospect subscribed to

  def send_email
    if self.subscribed_to == "welcome"
      SubscriberMailer.delay.welcome(self)
    end
  end
end
