  json.id @user.id
  json.nickname @user.nickname
  json.avatar_url @user.avatar_url
  json.account_id @user.account_id
  json.agreement @user.agreement
  json.tags Tag.all do |tag|
    json.id tag.id
    json.name tag.name
    json.checked @user.tags.include?(tag) 
  end
  json.start_at @user.start_at.strftime("%y年%m月%d日%H:%M")
  json.end_at @user.end_at.strftime("%y年%m月%d日%H:%M")
