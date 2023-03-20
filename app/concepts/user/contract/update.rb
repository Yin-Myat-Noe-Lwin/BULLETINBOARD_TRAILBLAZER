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
      
    end
  end