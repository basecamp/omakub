# boxkit

## Description

boxkit is a set of GitHub actions and skeleton files to build toolbox and distrobox images. Basically, clone this repo, make the changes you want, and then build what you need. Some examples include:

- [DaVinci Box](https://github.com/zelikos/davincibox) - Container for DaVinci Resolve installation and runtime dependencies on Linux
- [obs-studio-portable](https://github.com/ublue-os/obs-studio-portable) - OCI container image of OBS Studio that bundles a curated collection of 3rd party plugins
- [bazzite-arch](https://github.com/ublue-os/bazzite-arch) - A ready-to-game Arch Linux based OCI designed for use exclusively in distrobox

## Boxkit Alpine Example

You can use whatever distribution you want with boxkit, this is the initial example ([here are more](https://github.com/ublue-os/toolboxes/tree/main/toolboxes)):

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/ublue-os/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/ublue-os/boxkit -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.

### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set use Ptyxis](https://flathub.org/apps/app.devsuite.Ptyxis) and is the intended experience. 

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/quickstart/quickstart-cosign/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ublue-os/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/key_management/signing_with_self-managed_keys/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

## Finding Good Base Images

Of course you can make this however you want, but start with the [Toolbx Community images](https://github.com/toolbx-images/images).
These are a set of mostly-stock images with packages needed to run as a toolbox/distrobox already installed. 

Try to derive your blingbox from those base images so we can all help maintain them over time, you can't have bling without good stock!

Tag your image with `boxkit` to share with others!

## [![Repography logo](https://images.repography.com/logo.svg)](https://repography.com) / Recent activity [![Time period](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_badge.svg)](https://repography.com)
[![Timeline graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_timeline.svg)](https://github.com/ublue-os/boxkit/commits)
[![Issue status graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_issues.svg)](https://github.com/ublue-os/boxkit/issues)
[![Pull request status graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_prs.svg)](https://github.com/ublue-os/boxkit/pulls)
[![Trending topics](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_words.svg)](https://github.com/ublue-os/boxkit/commits)
[![Top contributors](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_users.svg)](https://github.com/ublue-os/boxkit/graphs/contributors)
[![Activity map](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_map.svg)](https://github.com/ublue-os/boxkit/commits)
