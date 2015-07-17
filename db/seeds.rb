# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Faker::Config.locale = 'en-US'

User.create!(username: "max", email: "max@max.max", password: "maxmax")

artists = ["Lil B", "MF DOOM", "Gucci Mane", "William Shakespeare", "William Shattner", "Will Smith", "Will.I.Am"]


artists.each do |artist|
  artist_model = Artist.create!(name: artist)
  10.times do

    case (1..3).to_a.sample
    when 1
      title = "Welcome to #{Faker::Address.city}, land of #{Faker::Commerce.department(1)}"
    when 2
      title = "#{Faker::Hacker.ingverb.capitalize} the #{Faker::PhoneNumber.area_code}"
    when 3
      title = "So #{Faker::Hacker.adjective.capitalize} they call me #{Faker::App.name}"
    end

    contents = Faker::Lorem.paragraph;

    artist_model.songs.create(title: title, contents: contents)
  end
end

contents = <<-LYRICSTRING
[Produced by Kanye West]

Ladies and gentlemen, let's put our hands together for this dynasty

[Intro]
Welcome ladies and gentlemen to the 8th wonder of the world
The flow of the century, always timeless, HOV!
Thanks for coming out tonight
You could've been anywhere in the world, but you're here with me
I appreciate that

[Verse 1]
H to the izz-O, V to the izz-A
For shizzle my nizzle used to dribble down in VA
Was herbin' em in the home of the Terrapins, got it dirt cheap for them
Plus if they was short with cheese I would work with them
Brought in weed, got rid of that dirt for them
Wasn't born hustlers, I was birthing 'em
H to the izz-O, V to the izz-A
For sheezy my neezy keep my arms so breezy
Can't leave rap alone, the game needs me
Haters want me clapped in chrome, it ain't easy
Cops want to knock me, D.A. wants to box me in
But somehow I beat them charges like Rocky
H to the izz-O, V to the izz-A
Not guilty, he who does not feel me
Is not real to me, therefore he doesn't exist
So poof! -- vamoose, son of a bitch!

[Hook]
H to the izz-O, V to the izz-A
For shizzle my nizzle used to dribble down in VA
H to the izz-O, V to the izz-A
That's the anthem, get your damn hands up!
H to the izz-O, V to the izz-A
Not guilty y'all got to feel me
H to the izz-O, V to the izz-A
That's the anthem, get your damn hands up!

[Verse 2]
I do this for my culture
To let them know what a nigga look like when a nigga in a Roadster
Show them how to move in a room full of vultures
Industry is shady, it needs to be taken over
Label owners hate me, I'm raising the status quo up
I'm overcharging niggas for what they did to the Cold Crush
Pay us like you owe us for all the years that you hoed us
We can talk, but money talks, so talk more bucks

[Hook]

[Verse 3]
Hov is back, life stories told through rap
Niggas acting like I sold you crack
Like I told you sell drugs; no, Hov did that
So hopefully you won't have to go through that
I was raised in the projects, roaches and rats
Smokers out back selling their mama's sofa
Lookouts on the corner focused on the ave
Ladies in the window, focused on the kinfolk
Me under a lamppost, why I got my hand closed?
Crack's in my palm, watching the long arm of the law
So you know I seen it all before
I've seen Hoop Dreams deflate like a true fiend's weight
To try and to fail: the two things I hate
Succeed, and this rap game: the two things that's great
H to the izz-O, V to the izz-A
What else can I say about dude? I gets bu-sy
LYRICSTRING

jayz = Artist.create!(name: "Jay-Z")
izzo = jayz.songs.create!(title: "Izzo", contents: contents)
izzo.song_fragments.create!(offset_start: 0, offset_end: 23)
izzo.song_fragments.create!(offset_start: 26, offset_end: 46)
