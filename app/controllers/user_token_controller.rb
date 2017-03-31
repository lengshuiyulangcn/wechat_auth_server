class UserTokenController < Knock::AuthTokenController

  def create
    render json: auth_token, status: :created
  end
  private
  def authenticate
    unless entity.present?
      raise Knock.not_found_exception_class
    end
  end
end
