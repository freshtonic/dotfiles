
HOME=$(shell echo $$HOME)
TARGETS=$(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.vim \
	$(HOME)/.nvim \
	$(HOME)/.nvim/autoload/pathogen.vim \
	$(HOME)/.vim/autoload/pathogen.vim \
	$(HOME)/.tmux.conf\
	$(HOME)/.vimrc \
	$(HOME)/.nvimrc \
	$(HOME)/.config/nvim \
	$(HOME)/.config/nvim/init.vim \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.editrc \
	$(HOME)/.inputrc \
	$(HOME)/.zshrc \
	$(HOME)/.gemrc \
	$(HOME)/.ackrc \
	$(HOME)/bin/gitvi \
	$(HOME)/bin/changedfiles \
	$(HOME)/bin/git2cl \
	$(HOME)/bin/xmlpp \
	$(HOME)/bin/xmldiff \
	$(HOME)/.ctags \
	$(HOME)/.Xmodmap \
	$(HOME)/.xterm-256color.ti

$(HOME)/.git-completion.bash: git-completion.bash
	cp git-completion.bash $@

$(HOME)/.gitconfig: gitconfig
	cp gitconfig $@

$(HOME)/.vim: vim
	cp -R vim $@

$(HOME)/.nvim: vim
	cp -R vim $@

$(HOME)/.vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.nvim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.tmux.conf: tmux.conf 
	cp tmux.conf $@

$(HOME)/.vimrc: vimrc
	cp vimrc $@

$(HOME)/.nvimrc: vimrc
	cp vimrc $@

$(HOME)/.config/nvim: $(HOME)/.vim
	ln -s $(HOME)/.vim $@

$(HOME)/.config/nvim/init.vim: $(HOME)/.config/nvim $(HOME)/.vimrc
	ln -s $(HOME)/.vimrc $@

$(HOME)/.zshrc: zshrc 
	cp zshrc $@

$(HOME)/.bashrc: bashrc
	cp bashrc $@

$(HOME)/.bash_profile: bash_profile
	cp bash_profile $@

$(HOME)/.inputrc: inputrc 
	cp inputrc $@

$(HOME)/.editrc: editrc 
	cp editrc $@

$(HOME)/.Xmodmap: Xmodmap
	cp Xmodmap $@

$(HOME)/.ackrc: ackrc
	cp ackrc $@

$(HOME)/.gemrc: gemrc 
	cp gemrc $@

$(HOME)/bin/gitvi: bin/gitvi
	cp bin/gitvi $(HOME)/bin/

$(HOME)/bin/changedfiles: bin/changedfiles
	cp bin/changedfiles $(HOME)/bin/

$(HOME)/bin/git2cl: bin/git2cl
	cp bin/git2cl $(HOME)/bin/

$(HOME)/bin/xmlpp: bin/xmlpp
	cp bin/xmlpp $(HOME)/bin/

$(HOME)/bin/xmldiff: bin/xmldiff
	cp bin/xmldiff $(HOME)/bin/

$(HOME)/.ctags: ctags
	cp ctags $@

# Works around Ctrl-H being misinterpreted as backspace in neovim
# due to bad OSX terminfo. Regular vim must ignore some OS-provided
# terminfo for it not to misbehave!
$(HOME)/.xterm-256color.ti:
	@infocmp xterm-256color | sed 's/kbs=^[hH]/kbs=\\177/' > $@

install: $(TARGETS) 

clean:
	rm -fr $(TARGETS) 
