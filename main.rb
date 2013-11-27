require_relative "db_connect"
class Main 

	def initialize
		#inp = 1
		#until inp == 99
			puts "\e[H\e[2J"
			puts "Choose action "
			puts "1) add new pass"
			puts "2) show pass"
			puts "3) edit pass"
			inp = gets
			puts inp
			if inp == "1\n"
				add_pass
			elsif inp == "2\n"
				show_pass
			elsif inp == "3\n"
				modify_pass
			else
				print "try again"
			end	
					 
			#p Info.find(inp) 
		#end	
	end	
 	def add_pass
 		print "Enter Title:  "
 		title = gets 
 		print "Enter user:  "
 		user = gets 
 		print "Enter Password:  "
 		pass = gets 
 		print "Enter Note:  "
 		note = gets 
 		print "Enter Link:  "
 		link = gets 
 		print "Choose Temnplate id:  "
 		Template.all.each do |tmpl|
 			p "#{tmpl.id} -> #{tmpl.name}"
 		end	
 		templ = gets 
 		print "Choose Group:  "
 		Group.all.each do |grp|
 			p "#{grp.id} -> #{grp.name}"
 		end	

 		group = gets 
 		new = Info.new(:title => title, :user => user, :password => pass, :note => note, :link => link, :template_id => templ, :group_id => group )
 		 if new.save
 		 	p "new switch was add to base"
 		 end	
 	end
 	def modify_pass
 	
 	end	
 	def open_link
 	
 	end
 	def show_pass
 	end

end
Main.new
