json.array! @users do |user|
  json.id user.id
  json.nickname user.nickname
  json.avatar_url user.avatar_url
  json.account_id user.account_id
  json.tags user.tags do |tag|
    json.name tag.name
  end
  json.start_at user.start_at.strftime("%y年%m月%d日")
  json.end_at user.end_at.strftime("%y年%m月%d日")
end
