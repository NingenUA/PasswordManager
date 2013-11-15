require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter =>"postgresql",
                                       :host => "78.137.1.200",
                                       :username => "postgres",
                                       :pass => "Gfhjkm",
                                       :database => "pass")
class Info < ActiveRecord::Base
	def new
  		@user = Info.new
  	end

  	def create
    	@user = Info.new(parameters)
      	@user.save
      	
	end
	private
		def parameters
    		params.require(:info).permit(:user, :password, :note, :link, :title)
  		end
  	   	
end
class Group < ActiveRecord::Base

end
class Template < ActiveRecord::Base

end

  


#g = Info.create(:id => 3, :user => "pilot2", :password => "one", :note => "notatki", :link => "vk.com", :title => "zamitku", :group_id => 1, :template_id => 1, :group => 1)

a = Info.last
b = Group.find(1)
c = Template.find(1)

p a
p b
p c
#p g
