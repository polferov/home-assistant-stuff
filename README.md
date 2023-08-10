# ha-stuff a container for doing stuff in home assistant

## Run

This command must be executed on the home assistant host.

```sh
docker run -d --restart always -v /var/run/docker.sock:/var/run/docker.sock -v data:/data -p 22:22 polferov/ha-stuff
```

The only way to access the host, as far as I am aware, is to do it physically via keyboard and display.
This is unfortunate if you are running it headless (like I am).
I got around this by temporarily removing it from its designated spot and moving it to the TV where i could do the setup.
After that, access to the host is no longer needed.