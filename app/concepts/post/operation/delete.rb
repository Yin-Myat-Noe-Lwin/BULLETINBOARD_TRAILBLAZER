# app/concepts/blog_post/operation/delete.rb
module Post::Operation
    class Delete < Trailblazer::Operation
      step Model(Post, :find_by)
      step :delete
  
      def delete(ctx, model:, **)
        model.destroy
      end
    end
  end