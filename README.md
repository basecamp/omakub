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
