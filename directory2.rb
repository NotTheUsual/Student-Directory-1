@students = []

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		exit
	else
		puts "I don't know what you mean, try again"
	end
end

def input_students(cohort = :January)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	name = STDIN.gets.chomp

	while !name.empty? do
		@students << {:name => name, cohort: cohort}
		puts "Now we have #{@students.length} students"

		name = STDIN.gets.chomp
	end
end

def show_students
	print_header("The Students of Makers Academy")
	print_names
	print_footer
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		file.puts student_data.join(",")
	end
	file.close
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(",")
		@students << {name: name, cohort: cohort.to_sym}
	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

def print_header(title, width=80)
	puts title.center(width)
	puts "=" * width
end

def print_names(first_letter = nil, max_length = 12)
	student_set = @students
	unless first_letter.nil?
		student_set.select!{|student| student[:name].chars.first == first_letter}
	end

	unless max_length.nil?
		student_set.select!{|student| student[:name].length <= max_length}
	end

	student_set.each_with_index do |student, index|
		puts "     #{index+1}. #{student[:name]}".ljust(40) + "|  (#{student[:cohort]})".ljust(40)
	end
end

def print_footer(width=80)
	puts "-"*width
	puts "Overall we have #{@students.length} great students".center(80)
end

try_load_students
interactive_menu