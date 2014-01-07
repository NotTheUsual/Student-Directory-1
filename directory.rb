students = [
	"Me",
	"James",
	"Andrey"
]

def print_header
	puts "The students of my cohort at Makers Academy \n
	-----------"
end

def print_names(names)
	names.each do |student|
		puts student
	end
end

def print_footer(names)
	puts "Overall we have #{names.length} great students"
end

print_header()
print_names(students)
print_footer(students)