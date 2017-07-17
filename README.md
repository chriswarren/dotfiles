# dotfiles

Copied extensively from [Andy's dotfiles](https://github.com/andydangerous/dotfiles) because it's his fault that I'm switching to vim.

### Install the dotfiles

##### HEADS UP

You may not want to run the setup script since it's a little heavy-handed. If you have some extant dotfiles then you can probably pick and choose what you want from here.

1. clone this repo
1. `cd` into the cloned dotfiles repo
1. `bin/setup.sh` will copy the dotfiles to your home directory, install pathogen, and install your vim plugins

### What's in here?

| file          | description   |
|:-------------:|---------------|
| .aliases      | shell, tmux, and git aliases are all sourced by the `.bash_profile` |
| .bash_profile | a bunch of settings and a sweet prompt from Josh Cheek |
| .gemrc        | probably too much in here, but the important thing is the `no-ri` and `no-doc` |
| .gitconfig    | Sets a few git things like user, email, autorebase branches, and push defaults to simple |
| .pryrc        | turns the damn pager off |
| .tmux.conf    | pretty much lifted verbatim from dotmatrix. Keeps tmux the way I like it. |
| .vimbundle    | just a list of vim bundle repos |
| .vimrc        | just right |

### Gotchas

The `bin/vim-bundle.sh` script only kind of works.
Make sure you get all the packages or things will be a little janky.

### Requirements

You'll need to install some software (duh).

* git
* tmux
* [Ag](https://github.com/ggreer/the_silver_searcher)

