class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, confirmation: {case_sensitive: false}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  after_save :send_email

  #program-1 is the general subscription
  #program0 is the 7 day diet challenge
  #people with higher program can access the lower program emails

  def send_email
    if self.subscribed_to == "program0"
      SubscriberMailer.delay.download_pdf(self)
    end
  end
end
