# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

   Teacher.create(name: 'Professor Rage', email: 'pr@tiy.com', password: 'dog')
   Achievement.create(name: 'Average Joe', description: 'Showed up to class, way to not fail!', points: 100)
   Achievement.create(name: 'Mission Accomplished', description: 'Assignment in on time, you can follow directions!', points: 100)
   Achievement.create(name: 'Chronomancer', description: 'You went back in time and did a make-up assignment, you only half fail!,', points: 50)
   Achievement.create(name: 'Hardcore Mode', description: 'You completed the extra credit challenge!', points: 100)
   Achievement.create(name: 'Zerg Rush', description: 'Completed a group assignment ahead of schedule', points: 200)
   Achievement.create(name: 'Terran-rific', description: 'Completed a group assignment on time', points: 150)
   Achievement.create(name: 'Proto-Fail', description: 'Completed a group assignment late. Construct additional pylons!', points: 100)
