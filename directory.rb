
#Put the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffreu Baratheon",
  "Norman Bates"
]

#and now we print them out

puts "The students of Villains Academy"
puts "-------------"
#iteration, each element of the array is assigned to 'student' and the code
#between do and end is executed
students.each do |student|
  puts student
end
#finally, we print the total number of students
puts "Overall, we have #{students.count} great students!"
