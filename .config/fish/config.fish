set -x GOPATH $HOME/Dropbox/dev
#set -x GOROOT /usr/local/go
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin

## vi mode
fish_vi_key_bindings

# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt 
end

# ubuntuで使うと消える
## prompt
function fish_prompt 
	if test "$fish_key_bindings" = "fish_vi_key_bindings"
		switch $fish_bind_mode
			case default
				set_color --bold red white
			case insert
				set_color --bold green white
			case replace-one
				set_color --bold green white
			case visual
				set_color --bold magenta white
			end
		echo (prompt_pwd) ">><(( ○> "
	end
end

#gitのbranch名出す
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

#右prompt
function fish_right_prompt
	echo (git_branch)
end

## cd後にls 
function cd 
	builtin cd $argv; and ls
end

# peco * ghq
function github
	ghq list --full-path | peco | read dist
	cd $dist
end

# pecoでdoshishaファイルに移動
function doshisha
	#ディレクトリ名だけ
	find ~/Dropbox/doshisha -type d | peco | read dist
	# ファイル名
	#find ~/Dropbox/doshisha -type f | peco | read dist
	#dirname "$dist" | read dist
	cd $dist
end

# current dirから検索して移動
function move 
	find . -type d | peco | read dist
	cd $dist
end

# current dirから検索してnvim
function fvim 
	find . -type f | peco | read file
	nvim $file
end

