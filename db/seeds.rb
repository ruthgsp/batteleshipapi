# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

game_set = GameSet.create(p1_udid: "1234", p2_udid: "5678")
game_set.worlds.create(player: "1234", x_coordinate: 0, y_coordinate: 0)
game_set.worlds.create(player: "5678", x_coordinate: 48, y_coordinate: 96)
