# Put your seeding script here
TransactionType.create!(:name       => "poll_add_on",
                        :points     => 0,
                        :repeatable => true)

TransactionType.create!(:name       => "coupon_rails_rumble",
                        :points     => 1500,
                        :repeatable => false)

Offer.create!(:transaction_type_id => TransactionType.find_by_name("starter_pack").id,
              :name                => "Starter Pack",
              :price               => 10.00,
              :display             => true,
              :start_at            => nil,
              :end_at              => nil)

Offer.create!(:transaction_type_id => TransactionType.find_by_name("pro_pack").id,
              :name                => "Pro Pack",
              :price               => 25.00,
              :display             => true,
              :start_at            => nil,
              :end_at              => nil)

Offer.create!(:transaction_type_id => TransactionType.find_by_name("coupon_rails_rumble").id,
              :name                => "rails_rumble",
              :price               => 0,
              :display             => false,
              :start_at            => nil,
              :end_at              => nil)
