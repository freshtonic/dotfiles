
$(HOME)/.vim: vim
	ln -f -s $(shell pwd)/vim $@

$(HOME)/.vimrc: vimrc
	ln -f -s $(shell pwd)/vimrc $@

$(HOME)/.bashrc: bashrc
	ln -f -s $(shell pwd)/bashrc $@

$(HOME)/.Xmodmap: Xmodmap
	ln -f -s $(shell pwd)/Xmodmap $@

$(HOME)/bin/gitvi: bin/gitvi
	cp bin/gitvi $(HOME)/bin/

install: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.bashrc \
	$(HOME)/bin/gitvi \
	$(HOME)/.Xmodmap

clean:
	rm -f $(HOME)/.vim \
        $(HOME)/.vimrc \
        $(HOME)/.bashrc \
        $(HOME)/bin/gitvi \
	$(HOME)/.Xmodmap
