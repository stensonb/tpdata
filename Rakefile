# -*- ruby -*-

require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :coverage do |t|
  ENV["COVERAGE"] = 'true'
  Rake::Task[:spec].execute
end
