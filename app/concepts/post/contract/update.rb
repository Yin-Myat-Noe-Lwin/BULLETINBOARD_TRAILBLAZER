# app/concepts/blog_post/contract/update.rb
module Post::Contract
    class Create < Reform::Form
      require "reform/form/dry"
      include Reform::Form::Dry
  
      property :title
      property :description
      property :privacy
  
      validation do
        params do
          required(:title)
          required(:description)
          required(:privacy)
        end
      end
      
    end
  end