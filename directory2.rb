require 'csv'
@students = []

MENU = {
	1 => :input_students,
	2 => :show_students,
	3 => :save_students,
	4 => :load_students,
	9 => :exit
}

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
	method = MENU[selection.to_i]
	return send(method) if method
	puts "I don't know what you mean, try again"
end

def input_students(cohort = :January)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	loop do
		name = STDIN.gets.chomp
		break if name.empty?

		add_one_student(name, cohort)
		puts "Now we have #{@students.length} students"
	end
end

def add_one_student(name, cohort)
	@students << {name: name, cohort: cohort}
end

def show_students
	print_header("The Students of Makers Academy")
	print_names
	print_footer
end

def save_students
	puts "Where would you like to save the student directory?"
	filename = STDIN.gets.chomp
	CSV.open(filename, "w") do |io|  
		@students.each { |student| io << [student[:name], student[:cohort]] }
	end
end

def load_students
	puts "Where would you like to load students from?"
	filename = STDIN.gets.chomp
	CSV.foreach(filename) do |item|
		name, cohort = item
		add_one_student(name, cohort.to_sym)
	end
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