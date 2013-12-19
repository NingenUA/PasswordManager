class CreateInfos < ActiveRecord::Migration
	def self.up
		create_table :infos do |t|
			t.string :title
			t.string :user
			t.string :pass
			t.text :note
			t.string :ip
			t.integer :template_id
			t.integer :group_id
			t.timestamp
		end
	end
	def self.down 
		drop_table :infos
	end
end	