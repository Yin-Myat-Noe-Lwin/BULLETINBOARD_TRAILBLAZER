module User::Operation

    class Index < Trailblazer::Operation
  
      step :find_all
  
      def find_all(ctx, **)
  
        ctx[:model] = ::User.all.reverse_order
  
      end
  
    end
    
  end