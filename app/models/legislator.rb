require_relative '../../db/config'

class Legislator < ActiveRecord::Base
	attr_reader :age, :name

	validates :party, presence: true

	# Elise's code

	def self.check(term, arg)
    self.where("#{term} = ?", arg)
  end

  def self.bystate(state, arg)
	  a = self.where("#{state} = ?", arg)

	  senators = a.where(title: "Sen").order(:lastname)

	  puts "Senators:"
	  senators.all.each do |x|
	    puts x.firstname + " " + x.lastname + " " + "(#{x.party})"
		end

		puts
		puts
	  puts 

	  rep = a.where(title: "Rep").order(:lastname)

	  puts "Representatives:"
	  rep.all.each do |x|
	    puts x.firstname + " " + x.lastname + " " + "(#{x.party})"
	  end
  end

	def self.bygender?(arg)
      a = self.where(in_office: "1")
      sen_count = a.where(title: "Sen").all.count
      rep_count = a.count - sen_count
      gender_sen_cnt = a.where("gender = ? and title = ?", arg, "Sen").count
      percent = (gender_sen_cnt/sen_count.to_f) * 100

      gender_rep_cnt = a.where("gender = ? and title = ?", arg, "Rep").count
      percentage = (gender_rep_cnt/rep_count.to_f) * 100

      if arg == "M"
        puts "Male Senators: " + gender_sen_cnt.to_s + "(#{percent}%)"
        puts "Male Representatives: " + gender_rep_cnt.to_s + "(#{percentage}%)"
      else
        puts "Female Senators: " + gender_sen_cnt.to_s + "(#{percent}%)"
        puts "Female Representatives: " + gender_rep_cnt.to_s + "(#{percentage}%)"
      end
  end

	def self.at_office?(term, arg)
	 
	       a = self.where("#{term}=?", arg).sample
		# @@ -42,8 +79,54 @@ def self.at_office?(term, arg)
	         puts "#{a.firstname} is out"
	         return false
	       end
	  end


	  def self.list_all
	    # num = 0
	    a = self.where(in_office: "1")
	    # puts a.count
	    arr = a.uniq.pluck(:state)

	    new_arr = []

	    arr.each do |x|
	      sen_count = a.where(title: "Sen", state: x).count
	      rep_count = a.where(title: "Rep", state: x).count
	      # num += (sen_count + rep_count)
	      if sen_count > 0 && rep_count > 0
	        new_arr << [x , sen_count, rep_count]
	      end
	        # puts "#{x}:  " + sen_count.to_s + " Senators, " + rep_count.to_s + " " + "Representatives(s)"
	    end
	 
	    sorted_arr = new_arr.sort{|a, b| b[2]<=> a[2]}

	    sorted_arr.each do |element|
	      puts "#{element[0]}:  " + element[1].to_s + " Senators, " + element[2].to_s + " " + "Representatives(s)"
	    end
	  end

	  def self.count
	    sen_count = self.where(title:"Sen").all.count
	    rep_count = self.where(title:"Rep").all.count

	    puts "Senators:   " + sen_count.to_s
	    puts "Representatives:   " + rep_count.to_s

	  end

	  def self.delete
	    puts "All records: " + self.all.count.to_s
	    puts self.where(in_office: "0").count.to_s
	    self.destroy_all(in_office: "0")

	    puts
	    puts "All records after delete: " + self.all.count.to_s
	  end
	end
end

