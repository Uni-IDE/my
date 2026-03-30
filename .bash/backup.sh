. lib/pre

to=$bacdir/$bacname

pre(){
	mkdir -p $to 
	echo $bacdir
}

ssh_bac(){
	archive=$to/.ssh.tgz
	if [ ! -f $archive ];then
		tar cfvz $archive ~/.ssh
	fi
}

main(){
	pre
	ssh_bac
}

main
