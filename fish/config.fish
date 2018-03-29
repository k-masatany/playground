# peco & ghq
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \cg  peco_select_ghq_repository
end

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH

# rbenv
set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
set -x PATH $PATH "$RBENV_ROOT/bin"
set -gx PATH '/Users/k-masatany/.anyenv/envs/rbenv/shims' $PATH
set -gx RBENV_SHELL fish
source '/Users/k-masatany/.anyenv/envs/rbenv/libexec/../completions/rbenv.fish'
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
end

# goenv
set -x GOROOT /Users/k-masatany/.anyenv/envs/goenv/versions/1.9.2
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x GOENV_ROOT "$HOME/.anyenv/envs/goenv"
set -x PATH $PATH "$GOENV_ROOT/bin"
set -x PATH $PATH $GOENV_ROOT/shims
set -x GOENV_SHELL "fish"
source '/Users/k-masatany/.anyenv/envs/goenv/libexec/../completions/goenv.fish'
command goenv rehash 2>/dev/null
function goenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (goenv "sh-$command" $argv|psub)
  case '*'
    command goenv "$command" $argv
  end
end

# nodenv
set -x NODENV_ROOT "$HOME/.anyenv/envs/nodenv"
set -x PATH $PATH "$NODENV_ROOT/bin"
set -x PATH $PATH '/Users/k-masatany/.nodenv/shims'
set -x NODENV_SHELL fish
source '/Users/k-masatany/.anyenv/envs/nodenv/libexec/../completions/nodenv.fish'
command nodenv rehash 2>/dev/null
function nodenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (nodenv "sh-$command" $argv|psub)
  case '*'
    command nodenv "$command" $argv
  end
end

# direnv
eval (direnv hook fish)

# rust
set -x PATH $PATH "$HOME/.cargo/bin"
set -x PATH $PATH "/usr/local/sbin"
set -x PATH $PATH "/usr/local/opt/coreutils/libexec/gnubin"

# java
set -x JAVA_HOME (/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8")
set -x PATH $PATH "$JAVA_HOME/bin"

# openssl
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

# alias
alias be "bundle exec"
alias rue "rbenv exec"
alias goe "goenv exec"
alias nde "nodenv exec"

# editor
set -x EDITOR vim

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/k-masatany/.ghq/github.com/k-masatany/master-up/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/k-masatany/.ghq/github.com/k-masatany/master-up/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/k-masatany/.ghq/github.com/k-masatany/master-up/node_modules/tabtab/.completions/sls.fish ]; and . /Users/k-masatany/.ghq/github.com/k-masatany/master-up/node_modules/tabtab/.completions/sls.fish
