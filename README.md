# remarkable-simulation
Minimal container setup to simulate a remarkable tablet

## What?

This repo has bits to run a container that simulates a remarkable tablet, barely.

Features:

- ssh on port 2200
- root login via ssh, password `alpine`

- directory `/home/root/.local/share/remarkable/xochitl/`
- directory `/usr/share/remarkable/templates/`

- file `/usr/share/remarkable/update.conf`, minimal content
- file `/usr/share/remarkable/templates/templates.json`, minimal content

- executable `/bin/systemctl`, alias for `echo`
- interface `wlan0`, type `dummy`

## How?

The docker command is fiddly because reasons so there's a script:

```sh
$ ./build+start
```

And later:

```sh
$ ./stop+remove
```


