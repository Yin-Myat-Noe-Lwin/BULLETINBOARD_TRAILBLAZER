class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :invitable , invite_for: 2.weeks
  # devise :invitable, :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  after_create :send_signup_confirm_email

  def send_signup_confirm_email
    UserMailer.example(self).deliver_now
  end

  # after_create -> {
  #   @user = current_user
  #   UserMailer.example(@user).deliver_now
  #  }

  #  after_create :send_email
  #  def send_email
  #    UserMailer.example(self.user).deliver_now
  #  end
end
