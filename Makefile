
/home/jsadler/.vim: vim
	ln -f -s $(shell pwd)/vim $@

/home/jsadler/.vimrc: vimrc
	ln -f -s $(shell pwd)/vimrc $@

/home/jsadler/.bashrc: bashrc
	ln -f -s $(shell pwd)/bashrc $@

/home/jsadler/.Xmodmap: Xmodmap
	ln -f -s $(shell pwd)/Xmodmap $@

/home/jsadler/bin/gitvi: bin/gitvi
	cp bin/gitvi /home/jsadler/bin/

all: /home/jsadler/.vim \
	/home/jsadler/.vimrc \
	/home/jsadler/.bashrc \
	/home/jsadler/bin/gitvi \
	/home/jsadler/.Xmodmap

clean:
	rm /home/jsadler/.vim \
        /home/jsadler/.vimrc \
        /home/jsadler/.bashrc \
        /home/jsadler/bin/gitvi \
	/home/jsadler/.Xmodmap
