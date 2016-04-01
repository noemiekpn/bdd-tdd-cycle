require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  movies = table.raw
  
  # Active Record objects can be created from a hash, a block or have their attributes manually set after creation. 
  # The new method will return a new object while create will return the object and save it to the database.	
  movies.each { |movie| Movie.create(:title => movie[0], :rating => movie[1], :director => movie[2], :release_date => movie[3])
  }
  
end

When(/^I go to the edit page for "(.*?)"$/) do |movie_title|
  movie = Movie.where(title: "#{movie_title}").first
  visit edit_movie_path(movie.id)
  
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |director_field, director_name|
  fill_in("#{director_field}", :with => director_name)
end

When(/^I press "(.*?)"$/) do |update_button|
  click_button(update_button)
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |movie_title, director_name|
  movie = Movie.where(title: "#{movie_title}").first
  movie.director.should == director_name
end

Given(/^I am on the details page for "(.*?)"$/) do |movie_title|
  movie = Movie.where(title: "#{movie_title}").first
  visit movie_path(movie) 
end

When(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should be on the Similar Movies page for "(.*?)"$/) do |movie_title|
  movie = Movie.where(title: "#{movie_title}").first
  current_path.should == similar_movies_path(movie.id)
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Then(/^I should be on the home page$/) do
  current_path.should == movies_path
end
