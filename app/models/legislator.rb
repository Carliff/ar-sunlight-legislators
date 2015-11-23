require_relative '../../db/config'

class Legislator < ActiveRecord::Base
	attr_reader :age, :name

	validates :party, presence: true
	#

	def name
		@name = first_name + " " + last_name
	end

	# def age
	# 	now = Date.today.year
 # 		@age = now - (birthdate.year)
	# end

end

# Testing for student data
 # student = Student.find(10)
 # p student.name
 # p student.age
 # p student.email

# student2 = Student.find_by(first_name: 'Andrew')
# p student.name
# p student.phone

# p Student.all