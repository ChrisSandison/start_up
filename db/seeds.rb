User.destroy_all

User.create(
  email: "chris.sandison@gmail.com",
  password: "password",
  password_confirmation: "password")