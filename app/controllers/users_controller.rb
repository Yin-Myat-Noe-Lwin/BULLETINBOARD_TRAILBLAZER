class UsersController < ApplicationController
  
  def index
    # @user = User.all
    run User::Operation::Index do |ctx|

      @model = ctx[:model]

      @total = @model.count
  
      render

    end

  end

end
