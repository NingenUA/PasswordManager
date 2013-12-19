require 'rubygems'
require 'active_record'
require 'crypt_keeper'


ActiveRecord::Base.establish_connection(:adapter =>"postgresql",
                                        :host => "localhost",
                                        :username => "postgres",
                                       #:pass => "Gfhjkm",
                                        :database => "pws")

class Template < ActiveRecord::Base
	has_many :infos , foreign_key: "template_id"

end
class Info < ActiveRecord::Base
	belongs_to :template 
	belongs_to :group
	
	crypt_keeper :password, :encryptor => :aes , :key => $secret

end
class Group < ActiveRecord::Base
	has_many :infos , foreign_key: "group_id"
end
