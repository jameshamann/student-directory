@students = []

def input_students
  puts "Please enter the name and the cohort the student will be joining".center(100)
  puts "To finish, just simply hit return 2 times".center(100)
  #ask for the first name
  puts
  puts 'Please enter your first and last name'.center(100)
  name = gets.chomp
  puts "Nice to meet you, #{name}! What cohort are you joining?".center(100)
  cohort = gets.chomp.to_sym
  #while the name is not empty, do this code:
  while !name.empty? || !cohort.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.count < 2
      puts "Now we have #{@students.count} student".center(100)
    else
      puts "Now we have #{@students.count} students".center(100)
    end
    #get another name from the user
    puts
    puts "Add an additional student or hit return twice to return to the menu".center(100)
    name = gets.chomp
    cohort = gets.chomp.to_sym
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  if @students.empty?
    puts "There are no students in this directory".center(100)
  else
    @students.each_with_index {|student, index| puts "#{index + 1} : #{student[:name]} , #{student[:cohort]} cohort.".center(100)}
  end
end


def print_footer
  if @students.empty?

  elsif @students.count < 2
  puts
  puts "Overall, we have #{@students.count} great student!".center(100)
  else
    puts
    puts "Overall, we have #{@students.count} great students!".center(100)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to \'students.csv\'"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't understand that, please try again."
  end
end

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over students array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

interactive_menu
