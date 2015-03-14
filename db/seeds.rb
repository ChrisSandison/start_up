puts "Clearing tables..."
User.destroy_all
Industry.destroy_all
Idea.destroy_all
Like.destroy_all

puts "Creating users..."
User.create(
  email: "chris.sandison@gmail.com",
  password: "password",
  password_confirmation: "password")

20.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
    )
end

puts "Creating communities..."
%w(health technology education finance travel).each do |tag|
  Industry.create(name: tag.capitalize)
end

tag_options = []
50.times do 
  tag_options << Faker::Lorem.word
end

industries = Industry.pluck(:id)
users = User.pluck(:id)


puts "Coming up with ideas..."
100.times do
  i = Idea.create(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph(2),
    industry_id: industries.sample,
    user_id: users.sample,
  )
  i.tag_list.add(tag_options.sample, tag_options.sample, tag_options.sample)
  i.save
end

ideas = Idea.pluck(:id)


puts "Liking ideas..."
User.all.each do |user|
  30.times do
    # draw a true or false
    like = rand(2)
    idea_id = ideas.sample
    if Like.where("user_id = ? and idea_id = ?", user.id, idea_id).blank?
      if like == 1
        Like.create(user_id: user.id, idea_id: idea_id, like: true)
      else
        Like.create(user_id: user.id, idea_id: idea_id, like: false)
      end 
    end
  end
end