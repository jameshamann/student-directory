

def input_students
  puts "Please enter the name, birth place, height, age and the cohort the student will be joining".center(100)
  puts "To finish, just simply hit return 5 times".center(100)
  #create an empty array
  students = []
  #ask for the first name
  puts
  puts 'Please enter your first and last name'.center(100)
  name = gets.chomp
  puts "Nice to meet you, #{name}! What cohort are you joining?".center(100)
  cohort = gets.chomp.downcase.to_sym
  puts 'Awesome! Now what is your approximate height (in meters, using numbers)'.center(100)
  height = gets.chomp
  puts 'Nice! Please enter your age (again, using numbers please)'.center(100)
  age = gets.chomp
  puts 'Great! Where were you born?'.center(100)
  location = gets.chomp
  #while the name is not empty, do this code:
  while !name.empty? || !cohort.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort , height: height, age: age, location: location}
    if students.count < 2
      puts "Now we have #{students.count} student".center(100)
    else
      puts "Now we have #{students.count} students".center(100)
    end
    #get another name from the user
    puts
    puts "Add an additional student, in the same order, or hit return 5 times to exit".center(100)
    name = gets.chomp
    height = gets.chomp
    age = gets.chomp
    location = gets.chomp
    cohort = gets.chomp.downcase.to_sym
  end
  students
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        #show students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't understand that, please try again."
    end
  end
end




def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  if students.empty?
    puts "There are no students in this directory"
  else
    students.each_with_index {|student, index| puts "#{index + 1} : #{student[:name]} , #{student[:cohort]} , #{student[:height]} meters , #{student[:age]} years of age, born in #{student[:location]}.".center(100)}
  end
end


def print_footer(students)
  if students.empty?

  elsif students.count < 2
  puts
  puts "Overall, we have #{students.count} great student!".center(100)
  else
    puts
    puts "Overall, we have #{students.count} great students!".center(100)
  end
end

interactive_menu.call
