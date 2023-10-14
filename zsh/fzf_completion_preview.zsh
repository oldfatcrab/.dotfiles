echo "\033[1m$2\033[0m\n"
if [ -n "$3" ]; then 
  mime=$(file -bL --mime-type "$3")
  category=${mime%%/*}
  if [ -d "$3" ]; then 
    eza --tree --level=2 --icons --color=always "$3"
  elif [ "$category" = "text" ]; then
    prettybat --color=always --style=plain --paging=never "$3"
  fi
fi

