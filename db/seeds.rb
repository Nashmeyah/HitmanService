2.times do
    killer = Killer.create(
        name: Faker::FunnyName.name,
        email: Faker::Internet.email, 
        specialty: Faker::Verb.past_participle
        )
    2.times do
        killer.victims.create(
            name: Faker::FunnyName.name,  
            time_of_death: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), 
            last_words: Faker::Quote.famous_last_words 
            )
    end
end