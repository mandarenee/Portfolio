# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake/testtask'

Rails.application.load_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  # t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

# Rake::TestTask.new("test:features" => "test:prepare") do |t|
#   t.libs << "test"
# end

# Rake::Task["test:run"].enhance ["test:features"]
