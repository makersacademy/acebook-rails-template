# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "builds the database, migrates and populates"
task :build_db do
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
end
