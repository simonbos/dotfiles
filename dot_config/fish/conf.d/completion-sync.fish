# https://github.com/pfgray/fish-completion-sync
#
# Adapted to not remove elements, because it also disables autoloading.
# This has the following issue:
# 1) load a direnv environment
# 2) autoload completion of a command (e.g. `task <tab>`)
# 3) unload the direnv environment
# 4) repeat steps 1 and 2 => you won't get autocompletion
#
# This adaptation should be OK, since the fish completion is added for the absolute path of a command.
# Therefore, if you have multiple versions of the same commands, the completion should work simultaneously.

# Filters an item from an array
# Usage:
#  > fish_completion_filter_from_array bar foo bar baz
#  > foo baz
function fish_completion_sync_filter
  set -l item $argv[1]
  set -e argv[1]
  set -l array $argv
  for array_item in $array
    if [ $array_item != $item ]
      echo $array_item
    end
  end
end

function fish_completion_sync_add_comp
  set -l array $argv
  for array_item in $array
    echo "$array_item/fish/vendor_completions.d"
  end
end

set -g FISH_COMPLETION_ADDITIONS

function fish_completion_sync --on-variable XDG_DATA_DIRS
  set -l FISH_COMPLETION_DATA_DIRS (fish_completion_sync_add_comp (fish_completion_sync_filter "" (string split ":" $XDG_DATA_DIRS)))

  # if there are paths in $XDG_DATA_DIRS
  # but not in $FISH_COMPLETION_ADDITIONS
  #   add them to $fish_complete_path
  #   add them to $FISH_COMPLETION_ADDITIONS
  for data_dir in $FISH_COMPLETION_DATA_DIRS
    if not contains $data_dir $FISH_COMPLETION_ADDITIONS
      if set -q FISH_COMPLETION_DEBUG
        echo "adding: $data_dir"
      end
      set -a fish_complete_path $data_dir
      set -a FISH_COMPLETION_ADDITIONS $data_dir
    end
  end
end
