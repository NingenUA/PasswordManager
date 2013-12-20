require_relative 'db_connect'
temp = Template.new(:name => "Zyxel")
temp.save
temp1 = Template.new(:name => "Zte")
temp1.save
grp = Group.new(:name => "Kanev")
grp.save
grp = Group.new(:name => "Smela")
grp.save
grp = Group.new(:name => "Cherkassy")
grp.save
