User.destroy_all
Industry.destroy_all

User.create(
  email: "chris.sandison@gmail.com",
  password: "password",
  password_confirmation: "password")

%w(health technology education finance travel).each do |tag|
  Industry.create(name: tag.capitalize)
end
