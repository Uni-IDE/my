#!/usr/bin/sh

homeBac=~/Home

last_project=~/src/Tree-Sitter.Backup/bash

ssh_key(){
	copy_ssh(){
		echo "Copying keys"
		cp -r $homeBac/.ssh ~/
	}

	if [ ! -d ~/.ssh ];then
		mkdir -p ~/.ssh
		copy_ssh
	elif [ ! -f ~/.ssh/id_rsa.pub ];then
		copy_ssh
	fi
}

aliase(){
	if [ ! -f ~/.alias ];then
		echo "Adding Aliases"
		cp $script_dir/.alias ~/
		echo ". ~/.alias" >> ~/.profile
		echo ". ~/.alias" >> ~/.bash_rc
	fi
}

history_set(){
cat >~/.bash_history<<EOL
git add .
git commit -am "0"
git push
git tag -a v0.1 -m "my" >>$
git push origin --tags
EOL
}

git_setup(){

	if [ ! -f ~/.gitconfig ];then
		git config --global user.email "you@example.com"
		git config --global user.name "Your Name"
		history_set
	fi
}


start_in(){
	cd $last_project
	bash
}

unpack_Home_bac(){
if [ -f ~/Home.tgz ] && [ ! -d $last_project ];then
	echo "Restoring src Repos"
	tar xfvz ~/Home.tgz
	cp -r ~/Home/src ~/
fi
}

var(){
	script_dir=`dirname "$(realpath $0)"`
	export script_dir
}

Last(){
	start_in
}

main(){
	var
	ssh_key
	aliase
	git_setup
	unpack_Home_bac
	Last
}

main

