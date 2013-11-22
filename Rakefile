require "find"
require "fileutils"
require_relative "project"

# Set up the source directory
source_dir = 'pegisis'

desc "Create a project based on pegisis"
task :project do
  project_name = name = ARGV.last
  puts source_dir
  project = Project.new(project_name, source_dir)	
  project.build
  task name.to_sym do ; end
end
