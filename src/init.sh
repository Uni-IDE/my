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

var(){
	script_dir=`dirname "$(realpath $0)"`
	export script_dir
}

main(){
	var
	ssh_key
	aliase
#	git_setup
#	start_in
#	unpack_Home_bac
}

main

