class UserMailer < ApplicationMailer
  default from: 'testing@example.com'
  default to: 'yinmyatnoelwin1@gmail.com'
    def example(user)
        mail( :to => "#{user.username} <#{user.email}>" , :subject => "Your Account Registeration was Successful")
    end

end
