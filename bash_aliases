alias vim="stty stop '' -ixoff ; vim" # allow C-s for save in vim

alias x='xmodmap ~/.xmodmap'

alias wh='which'

alias more='less'

alias v='vim'
alias p='pry'
alias m='more'
alias h='cat ~/.zsh_history | grep'

alias mdp='mkdir -p'

alias open='xdg-open'
alias o=open
alias clip='xclip -sel clip'

alias json='~/.scripts/json.rb'
alias rscript='~/.scripts/rbscript.rb'
alias hscript='~/.scripts/haskell-script.hs'
alias 2mp3='~/.scripts/2mp3.rb'

alias sagi='sudo apt-get install'
alias sagiy='sudo apt-get install -y'
alias agd='apt-cache show'
alias msm='mate-system-monitor'
alias ack=ack-grep

alias mp3='~/.mp3.rb'
alias jmplayer='~/.jmplayer.rb'

alias lc='wc -l'
alias co='wc -l'

alias cd..='cd ..'
alias cdd='cd ..'
alias cddd='cd ..; cd ..'
alias cdddd='cd ..; cd ..; cd ..'
alias cddddd='cd ..; cd ..; cd ..; cd ..'

alias sl='ls'
alias ll='ls -lh'
alias lla='ls -lha'
alias lld='ls -lh | grep "^d"'
alias llda='ls -lha | grep "^d"'
alias llad='ls -lha | grep "^d"'

alias f='fg'
alias ff='fg'
alias fgf='fg'
alias f1='fg %1'
alias f2='fg %2'
alias f3='fg %3'
alias f4='fg %4'
alias f5='fg %5'
alias fq='fg %1'
alias fw='fg %2'
alias fe='fg %3'
alias fr='fg %4'
alias ft='fg %5'

alias g='grep'
alias gi='grep -i'
alias gr='grep -R'
alias gv='grep -v'
alias ge='grep -e'
alias gvb='grep -v "^Binary"'
alias gvi='grep -vi'
alias giv='grep -vi'
alias gri='grep -Ri'
alias pgr='pcregrep'
alias pgrr='pcregrep -r'
grp() { # grep Phoenix dir
  grep -R $1 $2 2> /dev/null |
  grep -v "^node_modules/" |
  grep -v "^deps/" |
  grep -v "^_build/" |
  grep -v  "^bower_components/" |
  grep -v  "^priv/static/" |
  grep -v  "^erl_crash.dump" |
  grep -v "^Binary"
}
grpm() { grp $1 | more }

alias psg='ps -e | grep'

alias cpr='cp -r'
alias cpn='cp -n'
alias cprn='cp -rn'
# alias mvn='mv -n'
alias mvi='mv -i'

alias ba=' vim ~/.bash_aliases && source ~/.bash_aliases'
alias zh=' vim "+normal G" ~/.zsh_history'
alias ph=' vim ~/.pry_history'
alias deb=' vim ~/.dotfiles/debian.sh'
alias bits=' vim ~/.bits'
alias vh=' vim ~/.dotfiles/vim/snippets/haskell.snippets'
alias ve=' vim ~/.dotfiles/vim/snippets/elm.snippets'
alias vex=' vim ~/.dotfiles/vim/snippets/elixir.snippets'
alias vr=' vim ~/.dotfiles/vim/snippets/ruby.snippets'
alias vmd=' vim ~/.dotfiles/vim/snippets/markdown.snippets'
alias vrc=' vim ~/.dotfiles/vimrc'
alias hdf=' cd ~/.dotfiles'
alias to=' vim todo'

alias re='ruby -pe'
alias rv='ruby -v'

alias st='bundle exec srb tc'

alias r='rails'
alias rs='rails server'
alias rc='rails console'
alias rt='rake -T'
alias rtg='rake -T | g'
alias rtm='rake -T | m'
alias rr='rails routes'
alias rrm='rails routes | m'
alias rrg='rails routes | g'
alias rg='rails generate'
alias rd='rails destroy'
alias rdm='rake db:migrate'
alias rds='rake db:migrate:status'
alias rdr='rake db:rollback'
alias fs='foreman start web -p 3000'
alias rjs='cd app/assets/javascripts'
alias rbb='pushd app/assets/javascripts/backbone'
alias ra='rake'
alias t='rake test'
# alias t='ruby test/services/**/*_test.rb'
alias rspec='rspec --color --format doc'
alias rsp='bundle exec rspec'

alias elm-emp='~/dev/elm/emp/bin/emp'

alias ev='elixir -v'
alias el='cd ~/dev/elixir'

alias ghci='stack ghci'
alias hask='cd ~/dev/haskell'
sd() { stack ls dependencies | grep $1 }

alias ucm='/home/bosco/dev/unison/ucm'

alias _iex='iex'
alias iex='iex --erl $ERL_AFLAGS'
alias i='iex'
alias im='iex -S mix'
alias imr='iex -S mix run'
alias mec='mix ecto.create'
alias mem='mix ecto.migrate'
alias mecm='mix ecto.create && mix ecto.migrate'
alias mps='iex -S mix phx.server'
alias phs='iex -S mix phx.server'
alias mpr='mix phoenix.routes'
alias mprg='mix phoenix.routes | grep'
alias mt='mix test'
alias mtw='mix test.watch'
alias imt='iex -S mix test'
alias imtw='iex -S mix test.watch'
alias imtt='iex -S mix test --trace'
alias mdg='mix deps.get'
alias mc='mix compile'
alias mdc='mix deps.compile'
alias mh='mix help | grep'
alias mdgr='mix deps | grep'
alias ni='npm install'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias yicf='yarn install --check-files'
alias ycf='yarn --check-files'


alias b='bundle'
alias be='bundle exec'
alias bu='bundle update'
alias bs='bundle show'
alias bc='bundle console'
alias gf='vim Gemfile'

alias webshare='ruby -run -e httpd . -p 5555'

alias pj='python -mjson.tool'

alias gs='git status -s --untracked-files=no'
alias gsm='git status -s | m'
alias ga='git add'
alias gaa='git add .'
alias gau='git add -u .'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gcma='git commit -am'
alias agcm='git commit --amend -m'
alias agcam='git commit --amend -am'
alias gpa='git push origin --all'
alias gll='git log --oneline --decorate --graph'
alias gld='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gdh='git diff HEAD'
alias gdl='git diff "HEAD^"'
alias gco='git checkout'
# gco() { git checkout "$1" -- }
# # https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
# # https://stackoverflow.com/questions/19771455/git-alias-parameter-completion-doesnt-work-in-zsh
# # https://stackoverflow.com/questions/19771455/git-alias-parameter-completion-doesnt-work-in-zsh
# # https://stackoverflow.com/questions/9869227/git-autocomplete-in-bash-aliases
# if [ -f "/usr/share/bash-completion/completions/git" ]; then
#   source /usr/share/bash-completion/completions/git
#   __git_complete gco _git_checkout
# else
#   echo "Error loading git completions"
# fi
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias c='git commit -am'
alias s='git status -s'
alias gitsha='git rev-parse HEAD'

# alias gist='~/dev/ruby/gist/bin/gist'
alias ugist='gist --update-by-name'
alias pgist='gist -p -o'

alias lisp=sbcl
alias clojure='java -cp ~/dev/clojure/clojure/clojure-1.7.0.jar clojure.main'


# gsub() { grep -rl "$1" . | xargs sed -i "s/$1/$2/g" }

tm() { tree "$1" | m }
tdm() { tree -d "$1" | m }

alias mplayersub='mplayer -subcp utf8 -subfont "TakaoExGothic" -subfont-text-scale 3 -subfont-outline 1'

alias rtks='cat /home/bosco/rtk/rtk.xml | grep '

alias touchpadoff='synclient TouchpadOff=1'
alias touchpadon='synclient TouchpadOff=0'

alias r2='ssh rpi2'
alias r3='ssh rpi3'
