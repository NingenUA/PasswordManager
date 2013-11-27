require 'rubygems'
require 'active_record'
ActiveRecord::Base.establish_connection(:adapter =>"postgresql",
                                        :host => "localhost",
                                        :username => "postgres",
                                       # :pass => "Gfhjkm",
                                        :database => "pws")

class Template < ActiveRecord::Base
end
class Info < ActiveRecord::Base
end
class Group < ActiveRecord::Base
end
#c = Group.find(1)
#p c