class User < ApplicationRecord
    def self.from_token_request request
      code = request.params["code"]
      return nil unless code
      User.find_or_create_by_code(code)
    end

    def self.find_or_create_by_code(code)
      wechat_request_url  = "https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV["WECHAT_APP_ID"]}&secret=#{ENV["WECHAT_APP_SECRET"]}&js_code=#{code}&grant_type=authorization_code"
      response = HTTParty.post(wechat_request_url)
      open_id = JSON.load(response.body)["openid"]
      return nil unless open_id
      entity = self.find_by(open_id: open_id)
      unless self.find_by(open_id: open_id)
        entity = self.create(open_id: open_id)
      end
      return entity
  end
end
