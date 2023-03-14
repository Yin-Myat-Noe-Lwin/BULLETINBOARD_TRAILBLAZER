class UsersController < ApplicationController
  
  def index
    # @user = User.all
    run User::Operation::Index do |ctx|

      @model = ctx[:model]

      @total = @model.count
  
      render

    end

  end

  def destroy

    run User::Operation::Delete
    
      flash[:notice] = "User deleted"
      
      redirect_to users_path

  end

end
