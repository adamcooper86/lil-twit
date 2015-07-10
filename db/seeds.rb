require 'faker'
100.times do
   User.create username: Faker::Internet.user_name,
               password: Faker::Internet.password,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               city: Faker::Address.city,
               state: Faker::Address.state
 end

300.times do
  Tweet.create user_id: User.all.sample.id, content: Faker::Hacker.say_something_smart
end

50.times do
  Hashtag.create tag: ("#" + Faker::Hacker.adjective)
end
