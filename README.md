# Omakub

Turn a default Ubuntu installation into a fully-configured, beautiful, and modern development experience. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

This includes curating a set of applications and tools that one might discover through hours of watching YouTube, reading blogs, or just stumbling around Linux internet. All in service of someone coming straight from a platform like Windows or the Mac who shouldn't have to do all the configuration and curation legwork to see what all the fuss is about.

## Installers

Ubuntu has a great pair of package managers in apt and snap, but many of the tools that developers want either haven't been packaged, need more recent versions than what has been frozen in the LTS, or need actions post-install necessary for the best operation. These instructions are encoded in scripts present in install/*.sh.

## Dotfiles

Half the battle of getting a great development experience going on Linux lies in the dotfiles that control the configuration. Linux gets great power from how customizable it is, but that also presents a paradox of choice and a tall learning curve. Having good, curated defaults that integrate all the many tools in a coherent feel and look can help more developers acquire a taste for Linux, which they may then later inspire a fully bespoke setup (or not!).

## Starters

Many developers need to work with multiple versions of services like MySQL or Redis. There's a ton of different ways to solve that problem, but one easy one is use Docker, so that's what Omakub does. Instead of installing these services directly on the operating system, we run them as containers that can easily be swapped or run concurrently in different versions. 

## The Omakase Spirit

Nothing in Omakub provides solutions to problems you couldn't also solve a million other ways. The main benefit is in The Omakase Spirit. The idea that an entire setup experience can benefit from being tailored upfront by someone with strong opinions about what works and looks good together.

This doesn't make the choices necessarily better than other choices. Linux has inspired a million options for a million tastes. That's great and worthy of celebration.

But there's a large constituency of developers who are more than willing to trade ultimate bespoke customization for a cohesive package of goods.

## What's on the menu

### Alacritty
### Zellij
### Neovim w/ Lazyvim
### VSCode
### Google Chrome
### Docker
### Fonts
### Lazygit + Lazydocker
### Typora
### Ulauncher
### Tactile
### Ruby + Node
### Virtualbox
### eza/fzf/bat/rg/zoxide
### Spotify/Zoom/1password
### VLC/Signal/Pinta/Xournal
### Libraries and build tooling
### Theme

## Origin and context

Omakub was started by David Heinemeier Hansson to streamling his own Linux box boostrapping, as well as that of his employees at 37signals switching to Linux. That's very much a specific context where Ruby on Rails, web development tooling, and commercial services all intermingle. There's amble room to broaden that context to provide the same benefits to many other web developer communities, similarly dominated by a Mac bias. But that expansion will be carefully managed to stay with The Omakase Spirit. Rather install a few more tools than litter the project with endless configuration points. In the end, every tool preconfigured can be postconfigured in a different direction.

## Future ideas

Omakub is being born as a single, curated setup for one specific company in one particular domain. Going forward, we could well expand that to just be a shared base, where further specialization by other curators is possible.

But anyone using Omakub should still just have to run 1 command and the result should be 1 specific setup.

## FAQ

### Why not just use nixOS?

Ubuntu is the most popular mainstream Linux distribution. It's available out-of-the-box from major manufacturers. It's learning curve is low, it's polished, it's stable, and if you hit problems, you'll easily find others online with the same issue. That doesn't mean it's The Best. Nobody is ever going to convince all existing Linux users that their distro of choice isn't actually better. And some, like nixOS, have been specifically designed for some of the same preconfiguration ideas that we're exploring here. But it just doesn't matter. This is a project for tailoring Ubuntu (and derivatives built on it and similar base elements).
