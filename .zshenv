export SHELL=`which zsh`
export LANGUAGE=ja_JP:ja:en_GB:en
#export LC_ALL=C
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export PAGER=lv
export FTP_PASSIVE=1
export PATH=~/bin:/usr/local/firefox:$PATH
export LESS='-R'
export LESSOPEN='| $HOME/bin/src-hilite-lesspipe.sh %s'

#### changing title of screen's window by preexec()
if [ "$TERM" = "screen" ]; then
	chpwd () { echo -n "_`dirs`\\" }
	preexec() {
		emulate -L zsh
		local -a cmd; cmd=(${(z)2})
		case $cmd[1] in
			fg)
				if (( $#cmd == 1 )); then
					cmd=(builtin jobs -l %+)
				else
					cmd=(builtin jobs -l $cmd[2])
				fi
				;;
			%*) 
				cmd=(builtin jobs -l $cmd[1])
				;;
			cd)
				if (( $#cmd == 2)); then
					cmd[1]=$cmd[2]
				fi
				;&
			*)
				echo -n "k$cmd[1]:t\\"
				return
				;;
		esac

		local -A jt; jt=(${(kv)jobtexts})

		$cmd >>(read num rest
			cmd=(${(z)${(e):-\$jt$num}})
			echo -n "k$cmd[1]:t\\") 2>/dev/null
	}
	chpwd
fi
