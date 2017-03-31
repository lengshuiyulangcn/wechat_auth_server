class UserTokenController < Knock::AuthTokenController

  private
  def authenticate
    unless entity.present?
      raise Knock.not_found_exception_class
    end
  end
end
