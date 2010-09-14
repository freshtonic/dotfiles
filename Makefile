
HOME=$(shell echo $$HOME)

$(HOME)/.git-completion.bash: git-completion.bash
	cp $(shell pwd)/git-completion.bash $@

$(HOME)/.gitconfig: gitconfig
	cp $(shell pwd)/gitconfig $@

$(HOME)/.vim: vim
	cp -R $(shell pwd)/vim $@

$(HOME)/.vimrc: vimrc
	cp $(shell pwd)/vimrc $@

$(HOME)/.gvimrc: vimrc
	cp $(shell pwd)/gvimrc $@

$(HOME)/.zshrc: zshrc 
	cp $(shell pwd)/zshrc $@

$(HOME)/.bashrc: bashrc
	cp $(shell pwd)/bashrc $@

$(HOME)/.Xmodmap: Xmodmap
	cp $(shell pwd)/Xmodmap $@

$(HOME)/.irbrc: irbrc 
	cp $(shell pwd)/irbrc $@

$(HOME)/.gemrc: gemrc 
	cp $(shell pwd)/gemrc $@

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
	rm -fr $(HOME)/.git-completion.bash \
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

