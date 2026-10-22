# Shiloh — French DVD launch helper (Linux)

Unofficial, community launcher for **The X-Files Game (1998), French DVD edition**, tested by a player using **Shiloh 0.3.0 on Ubuntu**. This repository contains **no copyrighted game data** and does not modify Shiloh or the original DVD.

## Prerequisites

- An original French DVD or its own ISO image, already **mounted** read-only or extracted.
- Shiloh `xf` Linux binary: https://github.com/Asterber/shiloh/releases
- A compatible Linux x86-64 system with the dependencies required by Shiloh.

## Use

Mount your ISO (example):

```bash
sudo mkdir -p /mnt/xfiles-test
sudo mount -o loop,ro "$HOME/Jeux/XFiles/XFILES1.iso" /mnt/xfiles-test
```

Download this project, then:

```bash
chmod +x launch-xfiles-fr.sh
./launch-xfiles-fr.sh /mnt/xfiles-test "$HOME/Jeux/Shiloh/shiloh-v0.3.0-linux-x86_64/xf"
```

If `xf` is at the default path shown above, the second argument is optional.

The script points Shiloh at three data directories **in this order**:

```text
Francais/MININST
Francais/MEDINST
Francais
```

## Test status

- Main menu, voice acting, and dialogue reportedly in French.
- Cutscenes, initial interactions, and location changes reportedly work.
- Saving and loading tested on an earlier extracted-files setup; verify again with a clean ISO-only launch.
- A full playthrough has **not** yet been tested.

## Notes

This is a launch/configuration helper, **not** a translation patch or engine modification. The user must supply their own game files. The game may contain edition-specific bugs. Mounting paths must remain accessible while playing. To unmount after closing Shiloh: `sudo umount /mnt/xfiles-test`.

Report issues, noting the Shiloh version, locale, tested scene, and any `asset ... no file found` messages.
