class NotificationMailer < ApplicationMailer
  def contact_created(contact)
    @contact = contact
    mail(to: contact.email, subject: 'contact created')
  end
end
