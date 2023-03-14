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
  
    private
  
    def invite_params
      params.require(:user).permit(:email, :invitation_token, :phone, :address, :birthday)
    end
  
    def accept_invitation_params
      params.permit(:password, :password_confirmation, :invitation_token)
    end
  end