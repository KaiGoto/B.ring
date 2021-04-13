class NotificationMailer < ApplicationMailer
  def contact_created(contact)
    @contact = contact
    mail(to: ENV["TOMAIL"], subject: 'contact created')
  end
end
