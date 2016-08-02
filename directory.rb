def input_students
  puts "Please enter the name, birth place, height and age of the students".center(100)
  puts "To finish, just simply hit return 4 times".center(100)
  #create an empty array
  students = []
  #ask for the first name
  puts
  puts 'Please enter your first and last name'.center(100)
  name = gets.chomp
  puts 'Awesome! Now what is your approximate height (in meters, using numbers)'.center(100)
  height = gets.chomp
  puts 'Nice! Please enter your age (again, using numbers please)'.center(100)
  age = gets.chomp
  puts 'Great! Where were you born?'.center(100)
  location = gets.chomp
  #while the name is not empty, do this code:
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, location: location, height: height, age: age}
    if students.count < 2
      puts "Now we have #{students.count} student".center(100)
    else
      puts "Now we have #{students.count} students".center(100)
    end
    #get another name from the user
    puts
    puts "Add an additional student, in the same order, or hit return 4 times to exit".center(100)
    name = gets.chomp
    height = gets.chomp
    age = gets.chomp
    location = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each_with_index {|student, index| puts "#{index} : #{student[:name]} , #{student[:height]} meters , #{student[:age]} years of age, born in #{student[:location]} , (#{student[:cohort]} cohort)".center(100)}
end


def print_footer(students)
  if students.count < 2
  puts
  puts "Overall, we have #{students.count} great student!".center(100)
  else
    puts
    puts "Overall, we have #{students.count} great students!".center(100)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
