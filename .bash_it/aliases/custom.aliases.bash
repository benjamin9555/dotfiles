# Pretty ls
alias ll='ls -lah'

# Count all non-hidden files in a directory
alias count='ls -1 | wc -l'

# du sorted by name
alias dusort='du -hs *'
# du sorted by size
alias dusize='du -hs * | sort -h'

# List todo.txt task with prio A/B/C
alias tla='t lsp A'
alias tlb='t lsp B'
alias tlc='t lsp C'
