61 files checks , 99 issues - REMEMBER TO REVIEW COMMENTS LINES


2 problems in gem file, just a comments too long

Inside controller folder each file needs
Missing top-level class documentation comment.

 # frozen_string_literal: true on top  necessary on top of controllers files


 # rubocop:disable all on top of each files inside controller folder OR create a .rubocop.yml file in the main root and fill with this text: Documentation:
  								Enabled: false



Fixed indentation problems
61 files inspected, 76 offenses detected - We are going to run spec before and after
Before uncomment line 11 in application_controller.rb, same in each scenario.

We decide to comment line 11 in application controller.




CODE TO REVIEW
/app/controllers/application_controller.rb line 11 - 15
app/controllers/sessions_controller.rb line 9 
