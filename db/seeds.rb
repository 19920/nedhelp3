# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
render :json=> {:message=>{unfulfiled: @requests.where(status: 0, answers_count: [0,1,2,3,4]),
fulfiled: @requests.where.not(status: 0),
active: Request.includes(:conversations).where(conversations: {volunteer_id: current_user.id}, requests: {status: 0}),
closed: Request.includes(:conversations).where(conversations: {volunteer_id: current_user.id}).where.not(status: 0)},
   }
8.times do |n|
    User.create! email: Faker::Internet.email,
        password: "123qwe",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
end
(1..5).each do |counter|
    Request.create! title: Faker::Book.title,
    description: Faker::Lorem.paragraph(1, true, 4),
    latitude: Faker::Number.normal(60.5, 0),
    longitude: Faker::Number.normal(17, 0.1),
    user_id: counter,
    request_type: "help",
    address: 'sundsvall',
    answers_count: counter,
    status: 0
    (0..3).each do |conver|
        Conversation.create(volunteer_id: conver+ counter+1 , request_owner_id: counter, request_id: counter)
        8.times do |message|
            Message.create!(conversation_id: counter + conver ,
            body:Faker::Lorem.word,
            volunteer_id: counter+1,
            request_owner_id:counter,
            request_id: counter)

       end
    end
end
