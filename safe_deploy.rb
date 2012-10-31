# deploy.rb

# show introduction
HELP_INTRO = <<END
This script makes deployments a bit easier, and safer. Please use it.
Usage: $ ruby #{__FILE__} stage_to_deploy

END

stage_to_deploy = ARGV[0]

def fatal_error(msg)
	puts "\nFATAL ERROR: #{msg}"
	exit 1
end

def clean_exit(msg)
	puts "\nEXIT: #{msg}"
	exit 0
end

fatal_error("You did not specify which stage you wanted to deploy.") unless stage_to_deploy


def load_gem(name)
	begin
		require name
	rescue LoadError
		fatal_error("Could not find the 'git' gem, you may need to 'sudo gem install #{name}'")
	end
end

puts HELP_INTRO

# load dependencies
require "pathname"
load_gem('git')


working_dir = Pathname(File.dirname(__FILE__)).realpath

capfile_path = Pathname(File.join(working_dir, "Capfile")).realpath
# puts capfile_path

capfile_text = File.open(capfile_path) do |file|
	file.read
end
# puts capfile_text

re_branch = Regexp.new('^set\s+:branch,\s+\"([^\"]+)\"')
m_branch = re_branch.match(capfile_text)
fatal_error("branch is not configured (#{capfile_path})") unless m_branch
capfile_branch = m_branch[1]

re_stages  = Regexp.new('set :stages, %w\(([^\)]+)\)')
m_stages = re_stages.match(capfile_text)
fatal_error("stages is not configured (#{capfile_path})") unless m_stages
stages = m_stages[1].split(' ')
unless stages.include? stage_to_deploy
	puts "available stages:"
	stages.each{|stage| puts "- #{stage}"}
	fatal_error("The stage that you specified (#{stage_to_deploy}) is not one ov the available stages.")
end



g = Git.open(working_dir)
current_branch =  g.current_branch

if capfile_branch != current_branch
	puts "Capfile is configured to deploy the branch '#{capfile_branch}', but Git repo is currently on branch '#{current_branch}'"
	puts " Do you want to continue (y/n)?"
	answer = gets.chomp
	clean_exit("Deployment aborted (you answered '#{answer}')") unless answer.eql?('y')
end

if g.status.added.size > 0
	puts "Added files (not yet committed):"
	g.status.added.each do |file|
		puts "+ #{file[0]}"
	end
end

if g.status.deleted.size > 0
	puts "Deleted files (not yet committed):"
	g.status.deleted.each do |file|
		puts "- #{file[0]}"
	end
end

if g.status.changed.size > 0
	puts "Changed files (not yet committed):"
	g.status.changed.each do |file|
		puts "* #{file[0]}"
	end
end

# g.status.untracked() does not seem to honor the .gitignore file, so it lists all tmp/ files etc and that's too much noise
# if g.status.untracked.size > 0
# 	puts "Untracked files (not yet committed):"
# 	g.status.untracked.each do |file|
# 		puts "? #{file[0]}"
# 	end
# end

# g.status.each do |s|
# 	puts "status: #{s.inspect}"
# end

