# Get the seed poll
poll = Poll.first
options = poll.question.question_options.map(&:response_value)

# Create a bunch of users
1.upto(50) do |i|
  u = User.create! :email => "user#{i}@bogus.com", :username => "user#{i}", :password => 'test1234', :password_confirmation => 'test1234'
  r = u.responses.build
  r.poll = poll
  r.value = options[rand(options.size)]
  r.save!
end

