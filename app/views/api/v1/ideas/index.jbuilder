json.ideas @ideas do |idea|
  json.id idea.id
  json.title idea.title
  json.description idea.description
  json.likes idea.like_count
  json.dislikes idea.dislike_count
end