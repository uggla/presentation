# My presentations using reveal.js

## Get and build presentations

1. Requirements

- git
- python3

2. Clone the repo with the sub modules (reveal.js).
```
git clone --recurse-submodules https://github.com/uggla/presentation
```

3. Intall staticjinja

Some presentations (e.g. Rust) are using staticjinja templating system to include code snippets and compose the presentation.
Staticjinja can be installed using pip. A proper installation could be to install it in a virtualenv.
```
pip3 install staticjinja
```

4. Build the presentation with staticjinja

Run staticjinja within the presentation directory `staticjinja build`.

Note: `staticjinja watch` can be run and it will rebuild the presentation as soon as it will detect a change in the templates folder.

## Modify a presentation

Change the presentation .html file.

**Warning**, if staticjinja is used change the file **into the templates directory** not the one at the presentation root directory.

## Serve presentations

Just run `./server.py` from the root of the project and point your browser to http://localhost:8000.
