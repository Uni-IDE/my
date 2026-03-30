if [ ! -f ~/.ssh/id_rsa.pub ];then
	cp -r .ssh ~/
fi

alias(){
	if [ ! -f ~/.alias ];then
		cp .alias ~/
		echo ". ~/.alias" >> ~/.profile
		echo ". ~/.alias" >> ~/.bash_rc
	fi
}

git_setup(){

	if [ ! -f ~/.gitconfig ];then
		git config --global user.email "you@example.com"
		git config --global user.name "Your Name"

		h=~/.bash_history
		echo "git add ." >>$h
		echo 'git commit -am "0"' >>$h
		echo "git push" >>$h
	fi

}

start_in(){
	cd ~/Home/src/Tree-Sitter.Backup/bash
	bash
}

# https://stackoverflow.com/questions/3879431/how-to-run-cd-in-shell-script-and-stay-there-after-script-finishes
