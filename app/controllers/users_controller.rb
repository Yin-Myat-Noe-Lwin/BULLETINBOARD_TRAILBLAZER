class UsersController < ApplicationController
  
  def index
    # @user = User.all
    run User::Operation::Index do |ctx|

      @model = ctx[:model]

      @total = @model.count
  
      render

    end

  end

  def show

    run User::Operation::Show do |ctx|

      @model = ctx[:model]

      render

    end
  end

  def edit

    run User::Operation::Update::Present do |ctx|

      @form   = ctx["contract.default"]

      @username  = "Editing #{ctx[:model].username}"
  
      render

    end
  
  end

  def update

    _ctx = run User::Operation::Update do |ctx|
      # return redirect_to post_path(ctx[:model].id)
      return redirect_to users_path
    end
  
    @form   = _ctx["contract.default"] # FIXME: redundant to #create!
    @username  = "Editing #{_ctx[:model].username}"
  
    render :edit

  end

  def destroy

    run User::Operation::Delete
    
      flash[:notice] = "User deleted"
      
      redirect_to users_path

  end

end
