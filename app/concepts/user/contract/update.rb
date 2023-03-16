# app/concepts/blog_post/contract/update.rb
module User::Contract
    class Create < Reform::Form
      require "reform/form/dry"
      include Reform::Form::Dry
  
      property :username
      property :email
      property :phone
      property :address
      property :birthday
      property :role
      
      validates :username, unique: true
      validates :username, :length => { :in => 6..30}
      validates_uniqueness_of :username, :case_sensitive => false
      # validation do
      #   params do
      #     required(:username).filled
      #   end
      # end
      
    end
  end