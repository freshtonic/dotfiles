
HOME=$(shell echo $$HOME)

$(HOME)/.git-completion.bash: git-completion.bash
	cp $(shell pwd)/git-completion.bash $@

$(HOME)/.gitconfig: gitconfig
	cp $(shell pwd)/gitconfig $@

$(HOME)/.vim: vim
	cp -R $(shell pwd)/vim $@

$(HOME)/.vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R $(shell pwd)/vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.tmux.conf: tmux.conf 
	cp $(shell pwd)/tmux.conf $@

$(HOME)/.vimrc: vimrc
	cp $(shell pwd)/vimrc $@

$(HOME)/.zshrc: zshrc 
	cp $(shell pwd)/zshrc $@

$(HOME)/.bashrc: bashrc
	cp $(shell pwd)/bashrc $@

$(HOME)/.bash_profile: bash_profile
	cp $(shell pwd)/bash_profile $@

$(HOME)/.inputrc: inputrc 
	cp $(shell pwd)/inputrc $@

$(HOME)/.editrc: editrc 
	cp $(shell pwd)/editrc $@

$(HOME)/.Xmodmap: Xmodmap
	cp $(shell pwd)/Xmodmap $@

$(HOME)/.ackrc: ackrc
	cp $(shell pwd)/ackrc $@

$(HOME)/.gemrc: gemrc 
	cp $(shell pwd)/gemrc $@

$(HOME)/bin/gitvi: bin/gitvi
	cp bin/gitvi $(HOME)/bin/

$(HOME)/bin/powerline-shell.py: powerline-shell/powerline-shell.py
	cp powerline-shell/powerline-shell.py $(HOME)/bin/

$(HOME)/bin/changedfiles: bin/changedfiles
	cp bin/changedfiles $(HOME)/bin/

$(HOME)/bin/git2cl: bin/git2cl
	cp bin/git2cl $(HOME)/bin/

$(HOME)/bin/xmlpp: bin/xmlpp
	cp bin/xmlpp $(HOME)/bin/

$(HOME)/bin/xmldiff: bin/xmldiff
	cp bin/xmldiff $(HOME)/bin/

$(HOME)/.ctags: ctags
	cp $(shell pwd)/ctags $@

install: $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.vim \
	$(HOME)/.vim/autoload/pathogen.vim \
	$(HOME)/.tmux.conf\
	$(HOME)/.vimrc \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.editrc \
	$(HOME)/.inputrc \
	$(HOME)/.zshrc \
	$(HOME)/.gemrc \
	$(HOME)/.ackrc \
	$(HOME)/bin/gitvi \
	$(HOME)/bin/powerline-shell.py \
	$(HOME)/bin/changedfiles \
	$(HOME)/bin/git2cl \
	$(HOME)/bin/xmlpp \
	$(HOME)/bin/xmldiff \
	$(HOME)/.ctags \
	$(HOME)/.Xmodmap \
	command-t

command-t:
	bash -c "rvm use 1.8.7-p352 && cd ~/.vim/bundle/command-t/ruby/command-t && ruby ./extconf.rb && make"

clean:
	rm -fr $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.vim \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.editrc \
	$(HOME)/.inputrc \
	$(HOME)/.zshrc \
	$(HOME)/.gemrc \
	$(HOME)/.ackrc \
	$(HOME)/bin/gitvi \
	$(HOME)/bin/powerline-shell.py \
	$(HOME)/bin/changedfiles \
	$(HOME)/bin/xmlpp \
	$(HOME)/bin/xmldiff \
	$(HOME)/.ctags \
	$(HOME)/.Xmodmap

