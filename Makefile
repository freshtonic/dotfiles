
HOME=$(shell echo $$HOME)

$(HOME)/.git-completion.bash: git-completion.bash
	ln -f -s $(shell pwd)/git-completion.bash $@

$(HOME)/.gitconfig: gitconfig
	ln -f -s $(shell pwd)/gitconfig $@

$(HOME)/.vim: vim
	ln -f -s $(shell pwd)/vim $@

$(HOME)/.vimrc: vimrc
	ln -f -s $(shell pwd)/vimrc $@

$(HOME)/.gvimrc: vimrc
	ln -f -s $(shell pwd)/gvimrc $@

$(HOME)/.zshrc: zshrc 
	ln -f -s $(shell pwd)/zshrc $@

$(HOME)/.bashrc: bashrc
	ln -f -s $(shell pwd)/bashrc $@

$(HOME)/.Xmodmap: Xmodmap
	ln -f -s $(shell pwd)/Xmodmap $@

$(HOME)/.irbrc: irbrc 
	ln -f -s $(shell pwd)/irbrc $@

$(HOME)/.gemrc: gemrc 
	ln -f -s $(shell pwd)/gemrc $@

$(HOME)/bin/gitvi: bin/gitvi
	cp bin/gitvi $(HOME)/bin/

$(HOME)/bin/git2cl: bin/git2cl
	cp bin/git2cl $(HOME)/bin/

install: $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.gvimrc \
	$(HOME)/.bashrc \
	$(HOME)/.zshrc \
	$(HOME)/.irbrc \
	$(HOME)/.gemrc \
	$(HOME)/bin/gitvi \
	$(HOME)/bin/git2cl \
	$(HOME)/.Xmodmap

clean:
	rm -f $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.vim \
	$(HOME)/.gvimrc \
        $(HOME)/.vimrc \
        $(HOME)/.bashrc \
        $(HOME)/.zshrc \
        $(HOME)/.irbrc \
        $(HOME)/.gemrc \
        $(HOME)/bin/gitvi \
	$(HOME)/.Xmodmap

