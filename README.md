PasswordManager
===============

PasswordManager


Ruby practice, creating cli based Password manager

mostly for switch different kind like -> zte, dlink, zyxel, huawey

with auto-login to web, or telnet(ssh).

add crypto on password

Group -> it's for some order for example, there I record the city

Template -> it's give to know how to open this model of switch 

add migrations. 


Installation
========================================

1) bundle install
2) rake db:migrate VERSION=3   #or 1, 2 and 3
3) ruby  after_migration_run_this.rb   # to add template (Zyxel and Zte) and GROUP
4) ruby run_me.rb -> to start



