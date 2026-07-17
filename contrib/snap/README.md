# Vitcoin Snap Packaging

Commands for building and uploading a Vitcoin Core Snap to the Snap Store. Anyone on amd64 (x86_64), arm64 (aarch64), or i386 (i686) should be able to build it themselves with these instructions. This would pull the official Vitcoin binaries from the releases page, verify them, and install them on a user's machine.

## Building Locally
```
sudo apt install snapd
sudo snap install --classic snapcraft
sudo snapcraft
```

### Installing Locally
```
snap install \*.snap --devmode
```

### To Upload to the Snap Store
```
snapcraft login
snapcraft register vitcoin-core
snapcraft upload \*.snap
sudo snap install vitcoin-core
```

### Usage
```
vitcoin-unofficial.cli # for vitcoin-cli
vitcoin-unofficial.d # for vitcoind
vitcoin-unofficial.qt # for vitcoin-qt
vitcoin-unofficial.test # for test_vitcoin
vitcoin-unofficial.tx # for vitcoin-tx
```

### Uninstalling
```
sudo snap remove vitcoin-unofficial
```