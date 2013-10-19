# Put your seeding script here
u = User.find_by_email 'admin@pollse.com'
u.username = 'Rails Rumble'
u.save

