# Omakub

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

Omakub includes a curated set of applications and tools that one might discover through hours of watching YouTube, reading blogs, or just stumbling around Linux internet. All so someone coming straight from a platform like Windows or the Mac can immediately start enjoying a ready-made system, without having to do any configuration and curation legwork at all.

This isn't a project for someone already versed in the intricasies of nixOS or relishing a fresh install of Arch. It's using vanilla Ubuntu because that's one of the most widely adopted Linux distributions, and one that is even a pre-install option from many computer vendors. But while Ubuntu has a great package manager in apt, many of the tools that developers want either haven't been packaged, need more recent versions than what has been frozen in the LTS, or need actions post-install necessary for the best operation. Omakub includes all those scripts needed.

But package management is only half the battle of getting a great development experience going on Linux. The other half lies in the dotfiles that control the configuration. Linux gets great power from how customizable it is, but that also presents a paradox of choice and a tall learning curve. Having good, curated defaults that integrate all the many tools in a coherent feel and look can help more developers acquire a taste for Linux, which they may then later inspire a fully bespoke setup (or not!).

Nothing in Omakub provides solutions to problems you couldn't also solve a million other ways. The main benefit is in The Omakase Spirit. The idea that an entire setup experience can benefit from being tailored upfront by someone with strong opinions about what works and looks good together. This doesn't make the choices necessarily better than other choices. Linux has inspired a million options for a million tastes. That's great and worthy of celebration. But there's a large constituency of developers who are more than willing to trade ultimate bespoke customization for a cohesive package of goods, at least until they understand what all the options are and have fully bought into making the switch to Linux.

Omakub is for all these future Linux users.

## What's on the menu

Omakub contains a mix of open source and commercial software. This isn't meant as a Free Software Only compilation, but as a mixtape for working web developers who might begrudge Google, but still want to use the same Chrome browser that the majority of regular web users do. So you'll find that browser as the default (Firefox is still there too), Spotify is installed by default, as is Zoom, and even 1password. Don't worry, you can just remove (or ignore) anything you don't need or want.

But the heart of the pre-configuration lies in the terminal, [Alacritty](https://alacritty.org/), which runs [Zellij](https://zellij.dev/) to provide multiple panes/sessions. It's still bash underneath, but one configured with a host of great file system tools, like eza, fzf, rg, zoxide, and bg. Don't worry if you don't know what any of those things are! Watch the introduction video, and you'll see it all in action.

Then comes the editor. As much as I love [Neovim](https://neovim.io/) now, it's not for everyone, so by default Omakub comes with both Neovim (configured via [lazyvim](https://www.lazyvim.org/)) and Microsoft's VSCode. There are plenty of other choices, but these two are the ones that have been integrated into the unified theme picking (we'll get to that in a moment).

The overall UI of Ubuntu is of course Gnome, but it's been tweaked substantially to cater to a keyboard-first and window-tiling workflow. You shouldn't be moving windows around with a mouse like a savage when using this setup! Use the six default workspaces for apps (hotkeys: Super + 1/2/3/...), preferably full-screen ones on laptop displays (hotkey: F11), or tiled neatly using Tactile (hotkey: Super + T). Speed of motion is also why all the transition animations have nerfed. And start any app in the dock (hotkey: Super) based on it's position (hotkey: Alt + 1/2/3/4). So browser is just Alt+1, Terminal Alt+2, etc.

Additionally, [Ulauncher](https://ulauncher.io/) provides an app launcher ala raycast, which you trigger with Super+Space. And you can quickly enter emojis with the compose key (which is mapped to Caps Lock) m and then a single letter representing the emoji. Run omakub, pick hotkeys, and there you can see it all.

## What's the dress code

By default, Omakub ships with a Tokyo Night theme that looks ace with everything. But after installation, you can run the omakub command, select theme, and pick from one of the other handful of curated and fully integrated themes. Picking a new theme will set colors for the terminal (Alacritty + Zellij) and the editor (both VSCode and Neovim), as well as set a matching background image and Gnome UI accent color. It's pretty sweet!

The font is Microsoft's beautiful Cascadia Mono, patched by [Nerd Fonts](https://www.nerdfonts.com/). But also here there's a curated selection of alernatives. Run omakub, select font, and pick one of the options. It'll be set in terminal and editor automatically as well.

A handful of Gnome Extensions provide some additional sizzle with blurring of the shell, hiding desktop icons (so you can enjoy those background images!), and a handful of other tweaks. Run the Gnome Extensions Manager (try Super+Space extensions to open it with Ulauncher).

## What else

Omakub also installs...

- WhatsApp + Signal for messaging
- [Xournal++](https://xournalpp.github.io/) for filling out and signing PDF forms
- [Flameshot](https://flameshot.org/) for more powerful screenshotting (hotkey: Ctrl + Print Screen)
- VLC for playing videos
- [Pinta](https://www.pinta-project.com/) for quick image editing
- The gh command for GitHub's CLI
- Docker, with preconfigured containers for MySQL + Redis, and gives you the super cool TUI lazydocker to start/stop them. 
- rbenv and nodenv, as well as the recent versions for both, for managing multiple versions of each on the same system.
- A fix for the [Framework](https://frame.work/) 13's first generation display so fonts look proportional.

## Installing Omakub

You need three things to install Omakub:

- A computer. (I recommend the Framework 13 7640U/32GB/1TB from [Framework](https://frame.work/). Amazing laptop at a great price!)
- A USB thumb drive with 32GB+ to hold the Ubuntu installer.
- Ubuntu 24.04. See [the instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview) on how to install.

Then, with your fresh Ubuntu installation done, set your screen resolution to 200% (for those smooth looking fonts!), open the terminal with Ctrl+alt+t and enter:

```bash
wget -qO- https://omakub.org/install | bash
```

This will start the installation process. It's almost entirely automated. You just need to approve four Gnome Extension confirmations through the middle of it, and that's it. Then, when it's done, you approve to be logged out so all the settings can take effect. You log back in, and voila, your ready-to-rumble Omakub machine will great you with those cool Tokyo Night vibes.

## Origin and context

Omakub was started by me, David Heinemeier Hansson, to streamling my own Linux box boostrapping, as well as to [help our technical employees at 37signals switch to Linux](https://world.hey.com/dhh/linux-as-the-new-developer-default-at-37signals-ef0823b7). That's very much a specific context where Ruby on Rails, web development tooling, and commercial services all intermingle. There's amble room to broaden that context to provide the same benefits to many other web developer communities (many of which are also dominated by a Mac bias). But that expansion will be carefully managed to stay with The Omakase Spirit. Rather install a few more tools than litter the project with endless configuration points. In the end, every tool preconfigured can be postconfigured in a different direction.

## Future ideas

Omakub is being born as a single, curated setup for one specific company in one particular domain. Going forward, we could well expand that to just be a shared base, where further specialization by other curators is possible.

But anyone using Omakub should still just have to run 1 command and the result should be 1 specific setup.

### Acknowledgements

Default Tokyo Night and Rose Pine desktop backgrounds were designed by [freepik](https://freepik.com).
