# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

joueur_un = Player.create(pseudo: "Bob", points:0 )
joueur_deux = Player.create(pseudo: "John", points:0 )
joueur_trois = Player.create(pseudo: "Mike", points:0 )
joueur_quatre = Player.create(pseudo: "Jim", points:0 )

club_un = Club.create(name: "O.M", image_url:'https://i.eurosport.com/2017/04/30/2073448-43464179-640-360.jpg')
club_deux = Club.create(name: "Lille", image_url:'http://www.footmercato.net/images/a/de-nombreux-departs-sont-a-prevoir-a-lille_202620.jpg')
club_trois = Club.create(name: "Niort", image_url: 'http://www.allezredstar.com/images2012/m2848_NIORT.jpg')
club_quatre = Club.create(name: "Charenton", image_url:"https://static.ladepeche.fr/content/media/image/large/2017/07/03/201707031303-full.jpg")
