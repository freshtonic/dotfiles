
HOME=$(shell echo $$HOME)

$(HOME)/.vim: vim
	ln -f -s $(shell pwd)/vim $@

$(HOME)/.vimrc: vimrc
	ln -f -s $(shell pwd)/vimrc $@

$(HOME)/.gvimrc: vimrc
	ln -f -s $(shell pwd)/gvimrc $@

$(HOME)/.bashrc: bashrc
	ln -f -s $(shell pwd)/bashrc $@

$(HOME)/.git-completion.sh: git-completion.sh
	ln -f -s $(shell pwd)/git-completion.sh $@

$(HOME)/.Xmodmap: Xmodmap
	ln -f -s $(shell pwd)/Xmodmap $@

$(HOME)/.irbrc: irbrc 
	ln -f -s $(shell pwd)/irbrc $@

$(HOME)/bin/gitvi: bin/gitvi
	cp bin/gitvi $(HOME)/bin/

install: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.gvimrc \
	$(HOME)/.bashrc \
	$(HOME)/.irbrc \
	$(HOME)/bin/gitvi \
	$(HOME)/.Xmodmap

clean:
	rm -f $(HOME)/.vim \
	$(HOME)/.gvimrc \
        $(HOME)/.vimrc \
        $(HOME)/.bashrc \
        $(HOME)/.irbrc \
        $(HOME)/bin/gitvi \
	$(HOME)/.Xmodmap
