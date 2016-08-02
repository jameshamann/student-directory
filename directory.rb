def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  #create an empty array
  students = []
  #ask for the first name
  name = gets.chomp
  #while the name is not empty, do this code:
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(100)
    #get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each_with_index {|student, index| puts "#{index} : #{student[:name]} (#{student[:cohort]} cohort)".center(100)}
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students!".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)
