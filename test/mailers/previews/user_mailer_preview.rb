# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    class UserMailerPreview < ActionMailer::Preview

        def example
          UserMailer.example(@user.email)
        end
      
      end
end
