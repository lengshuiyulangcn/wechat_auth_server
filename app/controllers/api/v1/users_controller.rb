class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user, except: [:index] 

  def index
    @users = User.where(agreement: true)
  end

  def me
    @user = current_user 
  end

  def update
    current_user.attributes = user_params 
    current_user.tags = Tag.where(id: user_params[:tag_ids])
    current_user.save!
    render json:{response: "updated"}, status: 202
  end


  private
  def user_params
    params.permit(:account_id, :start_at, :end_at, :agreement, :tag_ids=>[])
  end
end
