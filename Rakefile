# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rake/testtask'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

task :run do
  ruby 'main.rb'
end

Rake::TestTask.new do |t| 
  t.libs << 'test' # adds the tests directory to the lists of directories in the #$LOADPATH
  t.test_files = FileList['test/*.rb']
  # creates a list of files that match “tests/test*.rb”
  t.verbose = true
  # if you want your tests to output what they should do, then set this to true.
end

