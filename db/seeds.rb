User.destroy_all
Industry.destroy_all

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

%w(health technology education finance travel).each do |tag|
  Industry.create(name: tag.capitalize)
end

tag_options = []
50.times do 
  tag_options << Faker::Lorem.word
end

100.times do
  i = Idea.create(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph(2),
    industry_id: rand(1..5),
    user_id: User.all.random.id,
  )
  i.tag_list.add(tag_options.sample, tag_options.sample, tag_options.sample)
  i.save
end