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

Run `./test/test-omakub.sh`:

```bash
./test/test-omakub.sh  \
  --vm     omakub-test \
  --passwd omakub        # password for “ubuntu” over RDP
```

Then wait until the VM finishes bootstrapping:

```bash
multipass shell omakub-test   # open a CLI in the VM
cloud-init status --wait      # blocks until cloud-init is done
exit
```

Get the VM's address:

```bash
multipass info omakub-test
```

And then connect over RDP to view the desktop. Run the `./install.sh` script after you connect to test the installation.

```bash
sudo snap install remmina # if remmina is not already installed
```

### Cleanup

To cleanup the VM, do the following:

```bash
multipass delete omakub-test
multipass purge        # frees disk space
```