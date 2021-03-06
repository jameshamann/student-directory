require 'csv'
@students = []

def input_students
  puts "Please enter the name and the cohort the student will be joining".center(100)
  puts "To finish, just simply hit return 2 times".center(100)
  #ask for the first name
  puts
  puts 'Please enter your first and last name'.center(100)
  name = STDIN.gets.chomp
  puts "Nice to meet you, #{@name}! What cohort are you joining?".center(100)
  cohort = STDIN.gets.chomp.to_sym
  #while the name is not empty, do this code:
  while !name.empty? || !cohort.empty? do
    #add the student hash to the array
    adding_to_hash(name, cohort)
    curr_student_count
    #get another name from the user
    puts
    puts "Add an additional student or hit return twice to return to the menu".center(100)
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp.to_sym
    end
end

def adding_to_hash(name, cohort)
  @students << {name: name.to_sym, cohort: cohort.to_sym}
end

def curr_student_count
  if @students.count < 2
    puts "Now we have #{@students.count} student".center(100)
  else
    puts "Now we have #{@students.count} students".center(100)
  end
end

def total_student_count
    if @students.count < 2
      puts "Overall, we have #{@students.count} great student!".center(100)
    else
      puts "Overall, we have #{@students.count} great students!".center(100)
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      puts "You have chosen to input the students manually"
      puts
      input_students
    when "2"
      puts "You have chosen to show all of the students in the directory"
      puts
      show_students
    when "3"
      puts "You have chosen to save the list, please chose a filename"
      @new_file = STDIN.gets.chomp
      puts "Great, your new file is #{@new_file}"
      save_students
    when "4"
      puts "You have chosen to load the students, please enter the filename"
      @new_file = STDIN.gets.chomp
        puts "Great, your chosen file is #{@new_file}"
      load_students
    when "9"
      puts "You have chosen to exit the program, thanks for using the app!"
      puts
      exit
    else
      puts "I don't understand that, please try again."
      puts
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
    puts
  else total_student_count
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  CSV.open(@new_file, "wb") do |csv|
    @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv << student_data

    end
  end
end

def read_students(filename)
  CSV.foreach(filename) do |row|
    name, cohort = row
    adding_to_hash(name, cohort)
  end
end


def load_students
  @new_file = ARGV.first || @new_file = "students.csv" # first argument from the command line
  if File.exists?(@new_file) # if it exists
     read_students(@new_file)
     puts "Loaded #{@students.count} from #{@new_file}"
  else # if it doesn't exist
  puts 'I\'m sorry that file doesn\'t exist, the default file \'students.csv\' has been loaded'
  read_students("students.csv") #load on startup by default
  puts "Loaded #{@students.count} from \'students.csv\'"
  end
end

load_students
interactive_menu
