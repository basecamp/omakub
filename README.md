# Omakub

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

Watch the introduction video and read more at [omakub.org](https://omakub.org).

## Contributing to the documentation

Please help us improve Omakub's documentation on the [basecamp/omakub-site repository](https://github.com/basecamp/omakub-site).

## License

Omakub is released under the [MIT License](https://opensource.org/licenses/MIT).

## Extras

While omakub is purposed to be an opinionated take, the open source community offers alternative customization, add-ons, extras, that you can use to adjust, replace or enrich your experience.

[⇒ Browse the omakub extensions.](EXTENSIONS.md)

## Local Testing 

We use [`canonical/multipass`](https://github.com/canonical/multipass) to test setups locally.

1. Launch a new VM


```bash
# Launch Ubuntu 24.04 with enough room for packages
multipass launch 24.04 \
  --name omakub-test \
  --disk 25G \
  --mem 8G
```


2. Shell into it

```bash
multipass shell omakub-test
```

3. Install

```bash
wget -qO- https://raw.githubusercontent.com/Aaronontheweb/ardbegian/refs/heads/master/install.sh | bash
```

4. Clean up

```bash
multipass delete omakub-test
multipass purge   # actually frees disk space
```