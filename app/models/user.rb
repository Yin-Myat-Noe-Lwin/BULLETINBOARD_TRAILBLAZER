class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :invitable , invite_for: 2.weeks , :validate_on_invite => true
  # devise :invitable, :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username 
  validates :username, :length => { :in => 6..30}
  validates_uniqueness_of :username, :case_sensitive => false

  validates_presence_of :phone 
  validates :phone, :length => { :in => 5..30}

  validates_presence_of :address 
  validates :address, :length => { :in => 2..30}

  validates_presence_of :birthday 
  validate :check_birthday_date

  after_create :send_signup_confirm_email , :unless => :invited_to_sign_up?

  after_invitation_accepted :send_signup_confirm_email
  
  private

    def check_birthday_date
      if birthday.to_s >= Date.today.to_s
        errors.add(:birthday, "must be before today date")
      end
    end

    def send_signup_confirm_email
      UserMailer.example(self).deliver_now
    end

end
