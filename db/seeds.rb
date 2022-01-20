Category.create(category: 'Sports', color: '#2b3252')
Icon.create(name: 'football',fasRef: 'fas fa-futbol')
Icon.create(name: 'basketball',fasRef: 'fas fa-basketball-ball')
Icon.create(name: 'golf',fasRef: 'fas fa-golf-ball')
Icon.create(name: 'swimming',fasRef: 'fas fa-swimmer')
Icon.create(name: 'volleyball',fasRef: 'fas fa-volleyball-ball')
Icon.create(name: 'running',fasRef: 'fas fa-running')
Icon.create(name: 'baseball',fasRef: 'fas fa-baseball-ball')
Icon.create(name: 'rugby',fasRef: 'fas fa-football-ball')
Icon.create(name: 'bowling',fasRef: 'fas fa-bowling-ball')
Icon.create(name: 'table-tennis',fasRef: 'fas fa-table-tennis')
Icon.create(name: 'fitness',fasRef: 'fas fa-dumbbell')

Category.create(category: 'Movies & Theater', color: '#ef5455')
Icon.create(name: 'cinema',fasRef: 'fas fa-ticket-alt')
Icon.create(name: 'filmmaking',fasRef: 'fas fa-film')
Icon.create(name: 'acting',fasRef: 'fas fa-theater-masks')
Icon.create(name: 'crafting',fasRef: 'fas fa-cut')
Icon.create(name: 'cosplays',fasRef: 'fas fa-hat-cowboy-side')

Category.create(category: 'Music', color: '#fad744')
Icon.create(name: 'concert',fasRef: 'fas fa-music')
Icon.create(name: 'producing',fasRef: 'fas fa-headphones')
Icon.create(name: 'fanclub',fasRef: 'fas fa-grin-hearts')
Icon.create(name: 'songwriting',fasRef: 'fas fa-pencil-alt')
Icon.create(name: 'instrument & vocal lessons',fasRef: 'fas fa-guitar')
Icon.create(name: 'recital',fasRef: 'fas fa-microphone')


Category.create(category: 'Food & Drinks', color: '#2b59c3')
Icon.create(name: 'cooking',fasRef: 'fas fa-birthday-cake')
Icon.create(name: 'recipe exchange',fasRef: 'fas fa-receipt')
Icon.create(name: 'tasting experience',fasRef: 'fas fa-drumstick-bite')
Icon.create(name: 'promotions',fasRef: 'fas fa-ad')
Icon.create(name: 'fundraisers',fasRef: 'fas fa-funnel-dollar')

Category.create(category: 'Education', color: '#d36582')
Icon.create(name: 'research',fasRef: 'fas fa-search')
Icon.create(name: 'analysing',fasRef: 'fas fa-eye')
Icon.create(name: 'skill learning',fasRef: 'fas fa-star')

Category.create(category: 'Games', color: '#8ea604')
Icon.create(name: 'video games',fasRef: 'fas fa-gamepad')
Icon.create(name: 'board games',fasRef: 'fas fa-border-all')
Icon.create(name: 'strategy games',fasRef: 'fas fa-chess-board')
Icon.create(name: 'card games',fasRef: 'fas fa-sd-card')

Category.create(category: 'Art', color: '#60d394')
Icon.create(name: 'shows',fasRef: 'fas fa-shoe-prints')
Icon.create(name: 'presentations',fasRef: 'fas fa-scroll')

Category.create(category: 'Explorations', color: '#d76a03')
Icon.create(name: 'hiking',fasRef: 'fas fa-hiking')
Icon.create(name: 'nature walk',fasRef: 'fas fa-tree')
Icon.create(name: 'trips',fasRef: 'fas fa-car-side')

Category.create(category: 'Spiritual', color: '#ff84e8')
Icon.create(name: 'gatherings',fasRef: 'fas fa-people-arrows')

Category.create(category: 'Late-night', color: '#7f2ccb')
Icon.create(name: 'restaurant',fasRef: 'fas fa-utensils')
Icon.create(name: 'bar',fasRef: 'fas fa-wine-glass')
Icon.create(name: 'club',fasRef: 'fas fa-address-card')
Icon.create(name: 'party',fasRef: 'fas fa-wine-bottle')
Icon.create(name: 'other',fasRef: 'fas fa-clipboard')

Category.create(category: 'Fundraisers', color: '#A06CD5')

Category.create(category: 'Other', color: '#E2CFEA')

RandomName.create(username: 'panda')
RandomName.create(username: 'lion')
RandomName.create(username: 'cat')
RandomName.create(username: 'dog')
RandomName.create(username: 'apple')
RandomName.create(username: 'pear')
RandomName.create(username: 'orange')
RandomName.create(username: 'bannana')
RandomName.create(username: 'pineapple')
RandomName.create(username: 'peach')
RandomName.create(username: 'cherry')
RandomName.create(username: 'grape')
RandomName.create(username: 'strawberrie')
RandomName.create(username: 'blueberry')
RandomName.create(username: 'rasberry')
RandomName.create(username: 'hamster')
RandomName.create(username: 'tiger')
RandomName.create(username: 'shark')
RandomName.create(username: 'fish')
RandomName.create(username: 'monkey')
RandomName.create(username: 'snake')
RandomName.create(username: 'mango')
RandomName.create(username: 'spider')
RandomName.create(username: 'cockroach')
RandomName.create(username: 'fly')
RandomName.create(username: 'woodlouse')
RandomName.create(username: 'watermelon')
RandomName.create(username: 'coconut')
RandomName.create(username: 'grapefruit')

# # users seed - creates 10 users
# 5.times do |n|
#     first_name = Faker::Name.first_name
#     last_name = Faker::Name.last_name
#     email = Faker::Internet.email
#     password = "password1"
#     twitter_username = "BBCNews"
#     user_tags = "football, snooker, baking, swimming, archery"
#     User.create!(
#         username: first_name,
#         first_name: first_name,
#         last_name: last_name,
#         email: email,
#         password: password,
#         password_confirmation: password,
#         twitter_username: twitter_username,
#         user_tags: user_tags)
#     puts "created user #{n+1}"
# end

# 1.times do |n|
#     title = Faker::Sports
#     description = Faker::Cannabis.brand 
#     host = "host_name"
#     attendee_max = 10
#     start_time = 
#     end_time =
#     longitude = 2
#     latitude = 2
#     icon = "fas fa-wine-glass"
#     tags = "football, football" #one sec kk
#     color = "#A06CD5"
#     status = 1
#     cost = 0
#     image = 
#     Activity.create!(
#         title: title,
#         description: description,
#         host: host,
#         attendee_max: attendee_max,
#         start_time: start_time,
#         end_time: end_time,
#         longitude: longitude,
#         latitude: latitude,
#         icon: icon,
#         tags: tags,
#         color: color,
#         status: status,
#         cost: cost)
#     puts "created activity #{n+1}"
#     j = 0
#     Chatroom.create!(
#         name: title,
#         activity_id: j++
#         )
#     puts "created chatroom #{n+1}"

#     l = 0
#     ChatroomUser.create!(
#         chatroom_id: l++,
#         user_id: 1,
#         hidden_name: "host"
#         )
#     puts "created chatroom user #{n+1}"
# end


AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') 