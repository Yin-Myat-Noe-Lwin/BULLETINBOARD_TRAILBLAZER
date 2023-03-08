# app/concepts/blog_post/contract/create.rb
module Post::Contract
    class Create < Reform::Form
      require "reform/form/dry"
      include Reform::Form::Dry
  
      property :title
      property :description
      property :privacy
  
      validation do
        params do
          required(:title).filled
          required(:description).maybe(min_size?: 9)
          required(:privacy).filled
        end
      end
    end
  end