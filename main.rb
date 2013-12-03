require_relative 'db_connect'
require "selenium-webdriver"


class Main 

	def initialize
		#inp = 1
		#until inp == 99
			system('cls')
			#puts "\e[H\e[2J"
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
				edit_pass
			else
				print "try again"
			end	
					 
			#p Info.find(inp) 
		#end	
	end	
 	def add_pass
 		system('cls')
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
 		system('cls') 		
 	end	
 	def open_link
 		system('cls') 	
 		x = 1
 		
 		#zte("172.17.4.118","KgVT8g49")
 		#zyxel
	end
	def zte(ip,pass)
		f = File.new("tmp/#{ip}.lua","w")
		f.puts ('lua_senddata("admin",true);lua_senddata('"#{pass}"',true);lua_start_trace();while true do res,value = lua_getdata();if string.match(value,">") then lua_reset_trace();lua_senddata("en",true);lua_senddata('"#{pass}"',true);break;end end')
		f.close
		system('putty.exe -telnet '"#{ip}"' -runlua text.txt')

	end
 	def zyxel(ip,pass)
 		#ready module, to autorisation on zyxel switch
 		driver = Selenium::WebDriver.for :firefox
		driver.get "http://admin:#{pass}@#{ip}/"
		initialize
	end
 	def show_pass
 		system('cls')
 		puts "Enter id:  "
 		id = gets
 		p Info.find(id)
 	end

end
Main.new
