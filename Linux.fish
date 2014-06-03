# Functions specific to Linux users
# Please note that this file is version controlled. 
# Use one of the local files (hostname or username) for user/host specific settings
set -gx ZENHOME /opt/zenoss
set -gx PATH $ZENHOME/bin $PATH
function fish_prompt -d "Write out the prompt"
	printf '%s%s@LinuxBox%s' (set_color red) (whoami) (set_color normal) 

	# Color writeable dirs green, read-only dirs red
	if test -w "."
		printf ' %s%s' (set_color green) (prompt_pwd)
	else
		printf ' %s%s' (set_color red) (prompt_pwd)
	end

        # Print subversion tag or branch
	if is_svn
                printf ' %s%s%s' (set_color normal) (set_color blue) (parse_svn_tag_or_branch)
        end
        
	# Print subversion revision
	if is_svn
		printf '%s%s@%s' (set_color normal) (set_color blue) (parse_svn_revision)
	end

	# Print git tag or branch
	if is_git
		printf ' %s%s{git:%s}' (set_color normal) (set_color blue) (parse_git_tag_or_branch)
		set git_ahead_of_remote (git_parse_ahead_of_remote)
		if [ -n "$git_ahead_of_remote" -a "$git_ahead_of_remote" != "0" ]
			printf ' +%s' (git_parse_ahead_of_remote)
		end
	end
	printf '%s> ' (set_color normal)
end
