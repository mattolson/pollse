Category.find_or_create_by_name("Movies")
Category.find_or_create_by_name("Television")
Category.find_or_create_by_name("Sports")
Category.find_or_create_by_name("Fashion")
Category.find_or_create_by_name("Food")

user = User.find_by_email('admin@pollse.com')
if user.nil?
  user = User.create!(
    :email => 'admin@pollse.com',
    :username => 'Rails Rumble',
    :password => 'admin1234',
    :password_confirmation => 'admin1234'
  )
end

poll_attributes = {:featured            => true, 
                    :vanity              => true,
                    :reveal_results      => true,
                    :enabled             => true,
                    :question_attributes => {:body => "Who is going to win Rails Rumble 2013?",
                                             :question_options_attributes => [{:response_value => "Pollse"},
                                                                              {:response_value => "Clock Tower"},
                                                                              {:response_value => "PkgHub"},
                                                                              {:response_value => "RubyScore"},
                                                                              {:response_value => "Codepipe"},
                                                                              {:response_value => "Other"}]}}

user.polls.create!(poll_attributes)
