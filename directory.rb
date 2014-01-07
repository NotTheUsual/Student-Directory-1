puts "The students of my cohort at Makers Academy"
puts "-------------"
students = [
	"Me",
	"James",
	"Andrey"
]

students.each do |student|
	puts student
end

# finally we print the total
puts "Overall we have #{students.length} great students"