# app/concepts/post/operation/create.rb
module Post::Operation
    class Create < Trailblazer::Operation
      # Only used to setup the form.
      class Present < Trailblazer::Operation
        step Model(Post, :new)
        step Contract::Build(constant: Post::Contract::Create)
      end
  
      step Subprocess(Present) # Here, we actually run the {Present} operation.
      step Contract::Validate(key: :post)
      step Contract::Persist()
      step :notify!
  
      def notify!(ctx, model:, **)
        ctx["result.notify"] = Rails.logger.info("New blog post #{model.title}.")
      end
    end
  end