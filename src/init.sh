last_project=~/src/Tree-Sitter.Backup/bash

ssh_key(){
	if [ ! -f ~/.ssh/id_rsa.pub ];then
		cp -r .ssh ~/
	fi
}

aliase(){
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
	cd $last_project
	bash
}

unpack_Home_bac(){
if [ -f ~/Home.tgz ];then
	tar xfvz ~/Home.tgz
	cd Home
	cp -r .ssh ~/
	cp -r src ~/
fi
}

main(){
	ssh_key
	aliase
	git_setup
	start_in
	unpack_Home_bac
}
# https://stackoverflow.com/questions/3879431/how-to-run-cd-in-shell-script-and-stay-there-after-script-finishes
