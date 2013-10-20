Category.find_or_create_by_name("Movies")
Category.find_or_create_by_name("Television")
Category.find_or_create_by_name("Sports")
Category.find_or_create_by_name("Fashion")
Category.find_or_create_by_name("Food")

user = User.create!(
  :email => 'admin@pollse.com',
  :username => 'Rails Rumble',
  :password => 'admin1234',
  :password_confirmation => 'admin1234'
)

q = user.questions.create!(:body => 'Who is going to win RailsRumble?')
['Tectonics', 'Melbourne Warriors', 'Los Coders', 'Devil Kittens'].each do |value|
  q.question_options.create!(:response_value => value)
end

p = user.polls.create!(
  :question_id => q.id,
  :featured => true,
  :vanity => true,
  :reveal_results => true,
  :enabled => true
)
