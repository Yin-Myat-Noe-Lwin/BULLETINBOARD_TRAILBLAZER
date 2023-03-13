# app/concepts/blog_post/contract/create.rb
module Post::Contract
    class Create < Reform::Form
      require "reform/form/dry"
      include Reform::Form::Dry
  
      property :title
      property :description
      property :privacy
      property :user_id
  
      validation do
        params do
          required(:title).filled.maybe(min_size?: 2).maybe(max_size?: 20)
          required(:description).filled.maybe(min_size?: 20)
          required(:privacy).filled
        end
      end
    end
  end