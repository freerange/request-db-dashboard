require 'environment'
require 'rake/testtask'

task "default" => ["test"]

Rake::TestTask.new(:test) do |t|
  files = FileList["test/**/*_test.rb"]

  t.libs << 'test'
  t.verbose = true
  t.test_files = files
end