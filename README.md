## WECHAT_SERVER

A wechat server demo used for user authentification. It's based on [knock](https://github.com/nsarno/knock).
It follows wechat auth flow. see more details here. [](https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html#wxloginobject)

## Usage

app_id and app_secret is needed for requesting user's open_id and sesssion_key. Please set environment variables before use.

```
set WECHAT_APP_ID=YOUR_APP_ID
set WECHAT_APP_SECRET=YOUR_APP_SECRET
```

Include the Knock::Authenticable module in your ApplicationController

```
class ApplicationController < ActionController::API
  include Knock::Authenticable
end
```

You can now protect your resources by calling authenticate_user as a before_action inside your controllers:

```
class SecuredController < ApplicationController
  before_action :authenticate_user

  def index
    # etc...
  end

  # etc...
end
```

You can access the current user in your controller with current_user.


A jwt is returned to the wechat applicaton if the authentification susseeded.

```
POST /user_token
{"code": CODE_FROM_WECHAT_LOGIN_API}

//or from wechat application

App({
  onLaunch: function() {
    wx.login({
      success: function(res) {
        if (res.code) {
          //发起网络请求
          wx.request({
            url: 'https://your_domain/user_token',
            data: {
              code: res.code
            }
          })
        } else {
          console.log('获取用户登录态失败！' + res.errMsg)
        }
      }
    });
  }
})

201 Created
{"jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"}
```

to make a request

```
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9
GET /my_resources
```

Other details please look at the code.
