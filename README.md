
P2
Viktoria Steiner & Magdalena Wimmer

–––––––––––––––––––––––––––––––––––––
a) Rails App für Zombie Tweets

First, created database table with

rails generate scaffold zombie name:string graveyard:string day_of_death:date number_of_arms:integer description:text

then migrated, and added zombies on the website (http://localhost:3000/zombies).

Tried out database console.
**********

Found Zombie with ID 2 with

z1 = Zombie.find(2)

Inserted new Zombie into database with

z4 = Zombie.new z4.name = "Helga" ...

and another one with

Zombie.create(:name => "Lisi", :graveyard => "Kuchl", :day_of_death => "1923-08-28", :number_of_arms => 2, :description => "Braiiins!")

Tried several Read requests.

Set number of arms from zombie 2 to 0 with:

z = Zombie.find(2) z.number_of_arms = 0

Deleted zombie 2 with

z.destroy
**********

Changed validations in app/models/zombie.rb Name and graveyard is now required, and number of arms needs to be above 0.

–––––––––––––––––––––––––––––––––––––
b) Tweets mit Referenz zu Zombies erzeugen

Generated Tweet model, new table was added with column status of type string and column zombie of type reference:

Add "has_many :tweets" to Zombie class.

Added tweet via web interface and via console with

z = Zombie.find(1) t = Tweet.create(:status => "I feel tasty!", :zombie => z)

Also tried deletions etc.

–––––––––––––––––––––––––––––––––––––
c) Fragen zu den Zombies

New tweet for a zombie: first, find the zombie, for example with

z = Zombie.find(2)

Create tweet either with

t = Tweet.create(:status => "I feel tasty!", :zombie => z)

or

t = Tweet.new t.status = "I feel tasty!" t.zombie = z t.save

or

t = Tweet.new(:status => "I feel tasty!", :zombie => z) t.save
**********

If zombie is deleted, tweets remain in database, but the reference is gone. Need on delete cascade, add ":dependent => :delete_all" to zombie class. Now, if the zombie is deleted, its responding tweets will be deleted too.
**********

SQL injections works in ruby console

Zombie.destroy_all("id = 1) OR 1=1--")

deletes all zombies
