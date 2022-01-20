class ContactUsMailer < ApplicationMailer
    def contact_email(name, email, message)
        @name = name
        @email = email
        @message = message
    end
end
