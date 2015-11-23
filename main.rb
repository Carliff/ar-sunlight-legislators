# puts "Putting results"
# p Legislator.where(state: "NY")
# puts "...................................."

# p Legislator.where(state: "NY", title: "Sen").limit(2)

# p Legislator.check("state", "NY")
# p Legislator.bystate("NY", "Sen")

# p Legislator.list("party", "title",["R", "Sen"])
# Legislator.list3("party", "title", "in_office" ,["R", "Sen","1"])

# a = Legislator.check("title","Rep").first
# puts a.congresspedia_url + " , " + a.firstname

# Legislator.at_office?("title","Rep")

#Legislator.bystate("state","NY")
# Legislator.bygender?("M")
# Legislator.list_all
# Legislator.count
  Legislator.delete