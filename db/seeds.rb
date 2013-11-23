# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project = Project.create!(
  github_repo: "BarefootCoders/Deployr",
  deploy_repo: "git@heroku.com:vinousmedia-staging.git",
  deploy_public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpJ4PMTzM34eavYl86Jtm7Cp7+3k72vQum4FZO4F/iO0cC5GXKuIECU3t5bG0+bL99lTz7Evn51DSAWwJwDY0pLoUhYR/qRwKgh7xYsqAHypj0lEtvrigNPIq8RWSAayQkfGUaojc77usxl+7ntiLBnOlHPgH6TcyuhIVBbsLlmwiFgneHm8fgAABSDHfJkM8fBIljXXIfmvPLYnFbE36WHPzFpDc92fKettPzocE8Ez/JrtbfaHsctDiYcMtPPopBsq3maQ/haB9DAnzLInDje6fONR/LdEsfT10NK3rkoT2nqgmyTEKlh9+u/fiaJZ9osSe8gAQKnCdnmBKGLwLd jasonberlinsky@Jasons-MacBook-Pro.local",
  travis_token: "lozskpAZMjVIZ-SgUoWTyw",
  github_token: "f9e6004a3353571a6fbe6d3f2f2d024027b76350"
)
