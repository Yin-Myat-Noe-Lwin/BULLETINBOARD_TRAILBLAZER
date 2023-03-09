class PostsController < ApplicationController

    def new

        run Post::Operation::Create::Present do |ctx|

            @form = ctx["contract.default"]

            render

          end

          # if ctx = Post::Operation::Create::Present.(params: params)
          #   @form = ctx["contract.default"]
          #   render
          # end

    end

    def create

        _ctx = run Post::Operation::Create do |ctx|

          return redirect_to posts_path

        end
      
        @form = _ctx["contract.default"]

        render :new

    end

    def index

      run Post::Operation::Index do |ctx|

        @model = ctx[:model]

        @total = @model.count
    
        render

      end
    
    end

    def show

      run Post::Operation::Show do |ctx|

        @model = ctx[:model]

        render

      end

    end

    def edit

      run Post::Operation::Update::Present do |ctx|

        @form   = ctx["contract.default"]

        @title  = "Editing #{ctx[:model].title}"

        @privacy = ctx[:model].privacy

        @public , @private = false

         if @privacy == 1
          @public = true
         elsif @privacy == 0
          @private = true
        end
    
        render

      end
    
    end

    def update

      _ctx = run Post::Operation::Update do |ctx|
        # return redirect_to post_path(ctx[:model].id)
        return redirect_to posts_path
      end
    
      @form   = _ctx["contract.default"] # FIXME: redundant to #create!
      @title  = "Editing #{_ctx[:model].title}"
    
      render :edit

    end

    def destroy

      run Post::Operation::Delete
    
      flash[:notice] = "Post deleted"
      
      redirect_to posts_path

    end

end
