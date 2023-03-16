class InvitationsController < Devise::InvitationsController

    def new
      super
    end
  
    def create
      User.invite!(invite_params, current_user)
        redirect_to users_path
    end
  
    def update
      user = User.accept_invitation!(accept_invitation_params)
    end
  
    def edit
    end
  
  end