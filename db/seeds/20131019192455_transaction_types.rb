# Put your seeding script here
TransactionType.create!(:name       => "sign_up",
                        :points     => 500,
                        :repeatable => false)

TransactionType.create!(:name       => "starter_pack",
                        :points     => 1000,
                        :repeatable => true)

TransactionType.create!(:name       => "pro_pack",
                        :points     => 5000,
                        :repeatable => true)
                        
TransactionType.create!(:name       => "standard_poll",
                        :points     => -200,
                        :repeatable => true)
                        
TransactionType.create!(:name       => "featured_poll",
                        :points     => -1000,
                        :repeatable => true)

TransactionType.create!(:name       => "adjustment",
                        :points     => 0,
                        :repeatable => true)

TransactionType.create!(:name       => "referral",
                        :points     => 250,
                        :repeatable => true)

TransactionType.create!(:name       => "facebook_connect",
                        :points     => 300,
                        :repeatable => false)
                        
TransactionType.create!(:name       => "twitter_connect",
                        :points     => 300,
                        :repeatable => false)
