json.user_name  @post.user.nickname
json.created_at  @post.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.image  @post.image
json.message  @post.message
json.tag  @post.tag
# json.user_id @postt.user_id