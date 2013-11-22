############################
#
# Class Project
#
# Sets up the project folder
#
############################

class Project
  def initialize(project, source_dir)
  	@project = project
  	@source_dir = source_dir
  end

  def build
  	self.copy_files
  	self.init_git
  end

  def init_git
  	Dir.chdir @project
  	system('git init')
  end

  def copy_files
	Find.find("#{@source_dir}") do |source|
	  target = source.sub(/^#{@source_dir}/, @project)
	  if File.directory? source
	    Find.prune if File.basename(source) == '.git'
	    FileUtils.mkdir target unless File.exists? target
	  else
	    FileUtils.copy source, target
	    puts "Copying #{source}"
	  end
	end
  end
end