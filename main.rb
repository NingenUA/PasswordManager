
require "selenium-webdriver"



class Main 

	def initialize
			#$secret = ""
			system('cls')
			puts
			puts "Hello"
			puts "Enter Password"
			$secret = gets
			$secret.strip!

			require_relative 'db_connect'
			main_menu
		
	end	
	def main_menu
		system('cls')
			#puts "\e[H\e[2J"
			puts "Choose action "
			puts "1) add new pass"
			puts "2) show pass"
			puts "3) exit"
			inp = gets
			puts inp
			if inp == "1\n"
				add_pass
			elsif inp == "2\n"
				show_pass
			elsif inp == "3\n"
				return
				
			else
				print "try again"
				main_menu
			end	
	end	
	
 	def add_pass
 		system('cls')
 		print "Enter Title:  "
 		title = gets.downcase 
 		print "Enter user:  "
 		user = gets 
 		print "Enter Password:  "
 		pass = gets
 		#pass =  Encryptor.encrypt(:value => pass.strip, :key => @secret)
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
 		 main_menu
 	end
 	def edit_pass(id)
 		begin
 		dev = Info.find(id)
 		rescue 
 			print "Wrong password"
 			print "Press Enter to go Main menu"
 			gets
 			main_menu
 		end
 		system('cls')
 		puts "1) Change title: #{dev["title"]}"
 		puts "2) Change user:  #{dev["user"]}"
		pass = dev["password"]
 		puts "4) Change Note: #{dev["note"]}"
 		puts "5) Change Link:  #{dev["link"]}"
 		puts "6) Change Temnplate id:  #{dev["template_id"]}"
		puts "7) Change Group id:  #{dev["group_id"]}"
		puts "8) back"
		inp = gets
		puts inp
		if inp == "1\n"
		  system('cls')
		  p dev["title"]
		  print "Enter new Title: "
		  inp = gets
		  dev["title"]=inp.strip.downcase
		  if dev.save
 		 	p "title was change"
 		 end
 		 edit_pass(id)	
		elsif inp == "2\n"
		  system('cls')
		  p dev["user"]
		  print "Enter new user name: "
		  inp = gets
		  dev["user"]=inp.strip
		  if dev.save
 		 	p "User name was change"
 		 end
 		 edit_pass(id)	
		elsif inp == "3\n"
		  system('cls')
		  p dev["password"]
		  print "Enter new Password: "
		  inp = gets
		  dev["password"]= inp.strip
		  if dev.save
 		 	p "Password was change"
 		 end	
 		 edit_pass(id)
 		 elsif inp == "4\n"
		  system('cls')
		  p dev["note"]
		  print "Enter new Note: "
		  inp = gets
		  dev["note"]=inp.strip
		  if dev.save
 		 	p "Note was change"
 		 end	
 		 edit_pass(id)
 		elsif inp == "5\n"
		  system('cls')
		  p dev["link"]
		  print "Enter new Link: "
		  inp = gets
		  dev["link"]=inp.strip
		  if dev.save
 		 	p "Link was change"
 		 end	
 		 edit_pass(id)
 		 elsif inp == "6\n"
		  system('cls')
		  p dev["template_id"]
		  print "Choose new Template: "
		   	Template.all.each do |tmpl|
 		 	p "#{tmpl.id} -> #{tmpl.name}"
 		 	end	
		  inp = gets
		  dev["template_id"]=inp.strip
		  if dev.save
 		 	p "Template was change"
 		 end	
 		 edit_pass(id)
 		 elsif inp == "7\n"
		  system('cls')
		  p dev["group_id"]
		  print "Choose new Group: "
		   	Group.all.each do |tmpl|
 		 	p "#{tmpl.id} -> #{tmpl.name}"
 		 	end	
		  inp = gets
		  dev["group_id"]=inp.strip
		  if dev.save
 		 	p "Group was change"
 		 end	
 		 edit_pass(id)
		elsif inp == "0\n"
			main_menu
		else
			print "try again"
		end	
 		main_menu
 	end	
 	def open_link(templ,link,pass)
 		system('cls') 	
 			if templ==1
				zyxel(link,pass) 
			elsif templ==2
				zte(link,pass)
			else
				print "don't know how open link"
				main_menu				
			end	 	
	end
	def zte(ip,pass)
		f = File.new("tmp/#{ip}.lua","w")
		f.puts ('lua_senddata("admin",true);lua_senddata("'"#{pass}"'",true);lua_start_trace();while true do res,value = lua_getdata();if string.match(value,">") then lua_reset_trace();lua_senddata("en",true);lua_senddata("'"#{pass}"'",true);break;end end')
		f.close
		system('putty.exe -telnet '"#{ip}"' -runlua tmp/'"#{ip}"'.lua')
		main_menu
	end
 	def zyxel(ip,pass)
 		#ready module, to autorisation on zyxel switch
 		driver = Selenium::WebDriver.for :firefox
 		
		driver.get "http://admin:#{pass}@#{ip}"
		main_menu
	end
 	def show_pass
 		system('cls')
		puts "Choose how you want find password "
		puts "1) by id"
		puts "2) by title"
		puts "3) by link"
		puts "4) To main page"
		inp = gets
		puts inp
		if inp == "1\n"
			find_id
		elsif inp == "2\n"
			find_title
		elsif inp == "3\n"
			find_link
		elsif inp == "4\n"
			main_menu
		else
			print "try again"
		end	
  	end
  	def show_id(id)
  			
  		begin
  			begin
 				dev = Info.find(id)
 			rescue ActiveRecord::RecordNotFound
 			print "Wrong ID "
        	puts
        	puts "Press Enter to return find menu"
        	gets
        	show_pass
 			end	
 		rescue 
 			print "Wrong password"
 			puts
 			puts "Press Enter to go Main menu"
 			gets
 			main_menu
 		end
 			begin
  				temp = Template.find(dev["template_id"])
  				group = Group.find(dev["group_id"])

 			system('cls')
 			puts "id -> #{dev["id"]}             Title -> #{dev["title"]}"
 	 		puts "login -> #{dev["user"]}      pass -> #{dev["password"]}"
 			puts ""
 			puts "note -> #{dev["note"]}  "
 			puts "IP -> #{dev["link"]}  "
 			puts ""
 			puts "Template -> #{temp["name"]}   Group -> #{group["name"]}"
 			puts ""
 			puts "Choose action : "
			puts "1) open"
			puts "2) edit pass"
			puts "3) back"
			rescue
  			end
 			inp = gets
			puts inp
			if inp == "1\n"
				open_link(dev["template_id"],dev["link"],dev["password"])
			elsif inp == "2\n"
				edit_pass(id)
			elsif inp == "3\n"
				show_pass
			else
  			end	
  		
  	end
  	def find_id
  		system('cls')
  		puts "Enter id:  "
 		id = gets
 	   
            show_id(id.strip)
        
        
        
  	end	
  	def find_title

  		system('cls')
  		puts "Enter title, or part of title:  "
 		tit = gets.downcase
 		dev = Info.find_by_sql("SELECT infos.* FROM infos WHERE infos.title LIKE '%#{tit.strip}%'")
 		system('cls')
 		if dev.empty?.!
 		puts "Choose id of switch "
 		dev.each do |dev|
 		 	p "#{dev.id} -> #{dev.title}"
 		 end	
 		 id = gets
 	  begin
           show_id(id.strip)
         rescue
            find_title
            print "wrong id"
         end
     else 
     	print "Try again"
     	find_title
     end
  	end
  	def find_link
  		system('cls')
  		puts "Enter ip, or part of ip:  "
 		tit = gets
 		dev = Info.find_by_sql("SELECT infos.* FROM infos WHERE infos.link LIKE '%#{tit.strip}%'")
 		system('cls')
 		if dev.empty?.!
 		puts "Choose id of switch "
 		dev.each do |dev| 		 	
 			p "#{dev.id} -> #{dev.title}  -> #{dev.link}"
 		 end	
 		 id = gets
 		 begin
 		 show_id(id.strip)
  		rescue
  			find_title
  			print "wrong id"
  		end
  		 else 
     	print "Try again"
     	find_link
     end
  	end

end
Main.new
