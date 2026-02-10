# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Role.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# Culver comments --> These steps are mostly executed in the terminal
# rails generate model Role
# rails generate model Actor
# rails generate model Movie
# rails generate model Studio
# rails generate model Agent
# after creating these, I went and added the relevant column headers that match our domain header to the new files created in db/migrate
# after adding those, in terminal I executed the table migration with "rails db:migrate"

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# insert studio
warner_bros = Studio.new
warner_bros["studio_name"] = "Warner Bros."
warner_bros.save

# insert movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["mpaa_rating"] = "PG-13"
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["mpaa_rating"] = "PG-13"
dark_knight["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["mpaa_rating"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros["id"]
dark_knight_rises.save

# insert agent
agent = Agent.new
agent["agent_name"] = "Culver Stedman Talent Agent"
agent.save

# insert actors
christian_bale = Actor.new
christian_bale["actor_name"] = "Christian Bale"
christian_bale["agent_id"] = agent["id"]
christian_bale.save

michael_caine = Actor.new
michael_caine["actor_name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson["actor_name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["actor_name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["actor_name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger["actor_name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["actor_name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal["actor_name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal.save

tom_hardy = Actor.new
tom_hardy["actor_name"] = "Tom Hardy"
tom_hardy.save

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt["actor_name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway["actor_name"] = "Anne Hathaway"
anne_hathaway.save

# Roles — Batman Begins
role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role["billing_order"] = 1
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role["billing_order"] = 2
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liam_neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role["billing_order"] = 3
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katie_holmes["id"]
role["character_name"] = "Rachel Dawes"
role["billing_order"] = 4
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role["billing_order"] = 5
role.save

# Roles — The Dark Knight
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role["billing_order"] = 1
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = heath_ledger["id"]
role["character_name"] = "Joker"
role["billing_order"] = 2
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = aaron_eckhart["id"]
role["character_name"] = "Harvey Dent"
role["billing_order"] = 3
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role["billing_order"] = 4
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = maggie_gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role["billing_order"] = 5
role.save

# Roles — The Dark Knight Rises
role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role["billing_order"] = 1
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role["billing_order"] = 2
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = tom_hardy["id"]
role["character_name"] = "Bane"
role["billing_order"] = 3
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = joseph_gordon_levitt["id"]
role["character_name"] = "John Blake"
role["billing_order"] = 4
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = anne_hathaway["id"]
role["character_name"] = "Selina Kyle"
role["billing_order"] = 5
role.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all

for movie in movies
  studio = Studio.find_by({ "id" => movie["studio_id"] })

  puts movie["title"].ljust(22) + movie["year_released"].to_s.ljust(15) + movie["mpaa_rating"].ljust(7) + studio["studio_name"]

end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
