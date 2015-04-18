# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user1 = User.create(
  email: "test1@email.com",
  password: "pass1234!",
  password_confirmation: "pass1234!",
  firstname: "Jan",
  lastname: "Smith")

admin = User.create(
  email: "admin1@email.com",
  password: "pass1234!",
  password_confirmation: "pass1234!",
  firstname: "John",
  lastname: "Kowalski")

admin.toggle!(:admin)
