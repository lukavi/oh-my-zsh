# ZSH Theme

# SSH Connection
function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "(%{$fg_bold[red]%}ssh%{$reset_color%}) "
  fi
}

# NEW EMAILS
fumction new_mails() {
  maildirs="$HOME/Mail/"
  find $maildirs -path '*/new/*' -type f | wc -l
}

# Grab the current date (%d-%m-%Y) and time (%H:%M:%S) wrapped in {}
LKV_CURRENT_TIME_="%{$reset_color%}{%{$fg[yellow]%}%D{"%d-%m-%Y"} %D{"%H:%M:%S"}%{$reset_color%}}"

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[red]%}┌$LKV_CURRENT_TIME_ [%{$fg[magenta]%}✉($(new_mails))%{$reset_color%}]\
$(ssh_connection)%{$reset_color%}%{$fg[blue]%}「%{$reset_color%}%~%{$fg[blue]%}」%{$reset_color%}
%{$fg[red]%}└─┤%{$reset_color%}%{$fg[$NCOLOR]%}%n%{$fg[green]%}@%m%{$reset_color%}%{$fg[red]%}│%{$reset_color%} \
$(git_prompt_info)\
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✘%{$reset_color%}"
