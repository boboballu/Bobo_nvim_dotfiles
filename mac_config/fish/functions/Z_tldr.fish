#####       fish custom finctions     ###
#####       Author: Tarungovindk      ###
## Date :###### Sun Feb 27 18:46:48 PST 2022
## Note: (1) one function per file; (2) file name must match function name
#  
function Z_tldr --description "Z_tldr <command> | Eg: Z_tldr awk"
	
	if test (count $argv) -lt 1; or test (count $argv) -gt 1; or test $argv = "--help"
		echo "Z_tldr <command> | Eg: Z_tldr awk"
	else
		set matches (find ~/custom_tools/tldr/pages -name "$argv*" | awk 'END { print NR }')
		if test $matches = 0
			echo "No matches"
		else if test $matches = 1
			set cmd (find ~/custom_tools/tldr/pages -name "$argv*")
			cat $cmd
		else
			find ~/custom_tools/tldr/pages -name "$argv*" | fzf | read foo
		end

		if [ $foo ]
			commandline "cat $foo"
		else
			commandline ''
		end
	end
end
