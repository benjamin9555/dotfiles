# Pretty ls
alias ll='ls -lah'

# Count all non-hidden files in a directory
alias count='ls -1 | wc -l'

# Disk usage sorted by name
alias dusort='du -hs *'
# Disk usage sorted by size
alias dusize='du -hs * | sort -h'

# List todo.txt task with prio A/B/C
alias tla='t lsp A'
alias tlb='t lsp B'
alias tlc='t lsp C'

# List todo.txt tasks for EPFL
alias tle='t list +e'

# Run ipython with napari profile
alias inap='ipython --profile=napari --gui=qt'

# Tensorboard
alias tb='tensorboard --logdir_spec'
