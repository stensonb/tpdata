require 'rspec/core/rake_task'

task default: :spec

desc "Run Specs"
RSpec::Core::RakeTask.new(:spec)

desc "Build Spec Coverage"
task :coverage do
  ENV["COVERAGE"] = 'true'
  Rake::Task[:spec].execute
end
