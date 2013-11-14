require 'rubygems'
require 'active_record'
ActiveRecord::Base.establish_connection(:adapter =>"postgresql",
                                        :host => "78.137.1.200",
                                        :username => "postgres",
                                        :pass => "Gfhjkm",
                                        :database => "pass")

class Template < ActiveRecord::Base
end
class Info < ActiveRecord::Base
end
class Group < ActiveRecord::Base
end
c = Template.find(1)
p c
