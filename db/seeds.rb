# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Put tables that have foreign keys first
Team.delete_all
Feedback.delete_all
User.delete_all
Presentation.delete_all

Presentation.create!([
                       { id: 1, name: "Team 8's gr8 final presentation", final_score: 100 },
                       { id: 2, name: "Team 4's final presentation", final_score: 50 },
                       { id: 3, name: "Team 2's presentation", final_score: 25 }
                     ])
puts "Created #{Presentation.count} presentations"

User.create!([
               { id: 1, email: 'giles.25@osu.edu', privileged: true, name: 'Charlie Giles', username: 'giles.25',
                 password: '123', password_confirmation: '123', is_active: true },
               { id: 2, email: 'scheatzle.13@osu.edu', privileged: false, name: 'Carter Scheatzle',
                 username: 'scheatzle.13', password: '123', password_confirmation: '123', is_active: true },
               { id: 3, email: 'penrose.26@osu.edu', privileged: false, name: 'Kevin Penrose', username: 'penrose.26',
                 password: '123', password_confirmation: '123', is_active: true },
               { id: 4, email: 'maralla.2@osu.edu', privileged: false, name: 'Lohith Maralla', username: 'maralla.2',
                 password: '123', password_confirmation: '123', is_active: true },
               { id: 5, email: 'zhou.3458@osu.edu', privileged: false, name: 'Matthew Zhou', username: 'zhou.3458',
                 password: '123', password_confirmation: '123', is_active: true },
               { id: 6, email: 'doe.1@osu.edu', privileged: false, name: 'John Doe', username: 'doe.1', password: '123',
                 password_confirmation: '123', is_active: true }
             ])
puts "Created #{User.count} users"

Feedback.create!([
                   { id: 1, presentation_id: 1, feedback: 'Brought me to tears', score: 100, user_id: 2 },
                   { id: 2, presentation_id: 2, feedback: 'Good job!', score: 100, user_id: 4 },
                   { id: 3, presentation_id: 2, feedback: 'Nice', score: 90, user_id: 5 },
                   { id: 4, presentation_id: 3, feedback: 'Well done!', score: 95, user_id: 3 },
                   { id: 5, presentation_id: 3, feedback: 'GJ', score: 90, user_id: 6 }
                 ])
puts "Created #{Feedback.count} feedbacks"

Team.create!([
               { id: 1, presentation_id: 1, user_id: 6 },
               { id: 2, presentation_id: 2, user_id: 2 },
               { id: 3, presentation_id: 2, user_id: 3 },
               { id: 4, presentation_id: 3, user_id: 4 },
               { id: 5, presentation_id: 3, user_id: 5 }
             ])
puts "Created #{Team.count} teams"
