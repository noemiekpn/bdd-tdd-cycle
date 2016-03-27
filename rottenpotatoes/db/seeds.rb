# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Steven Spielberg"},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984', :director => "Steven Spielberg"},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989', :director => "Steven Spielberg"},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011', :director => "Steven Spielberg"},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001', :director => "Steven Spielberg"},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001', :director => "Steven Spielberg"},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968', :director => "Steven Spielberg"},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004', :director => "Steven Spielberg"},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981', :director => "Steven Spielberg"},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000', :director => "Steven Spielberg"},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
