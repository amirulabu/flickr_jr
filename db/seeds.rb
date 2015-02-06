u1 = User.create(username: "syed", password: "123")
u2 = User.create(username: "amirul", password: "123")

album1 = Album.create(title: "party till subuh")
album2 = Album.create(title: "kelas programming")

u1.albums << album1
u2.albums << album2


