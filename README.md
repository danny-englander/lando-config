# Example Lando config for Xdebug

This repo contains some example [Lando](https://docs.lando.dev/) config that 
works for Xdebug on both Mac and Linux inside WSL 2 on Windows. There might
be other things found useful here as well.

Some key bits are shown below:

## ./.lando.yml

```yaml
config:
  # Make false if you need better performance and dont need to use XDebug.
  xdebug: true
```

```yaml
services:
  appserver:
     xdebug: true
    # Point to custom development php.ini
    config:
      php: '.lando/config/php.ini'
    overrides:
      environment:
        XDEBUG_CONFIG: 'remote_enable=1 remote_host=host.docker.internal'
```

## ./.lando/config/.php.ini

```bash
xdebug.max_nesting_level = 256
xdebug.show_exception_trace = 0
xdebug.collect_params = 0
xdebug.mode = debug
xdebug.client_host = ${LANDO_HOST_IP}
xdebug.client_port = 9003
xdebug.start_with_request = yes
xdebug.log = /tmp/xdebug.log
xdebug.discover_client_host = 0
error_log = /tmp/php_error.log
```
## Tested on:

* Mac OS / Lando with Docker desktop (Lando v3.0.26)
* Windows 10 with Lando installed inside WSL 2 / Ubuntu Linux, i.e. not Lando for Windows (Lando v3.0.26)

## Toggle Xdebug on and off

There are also a few commands to quickly toggle Xdebug on and off
* Turn Xdebug off: `xoff`
* Turn Xdebug on: `xon`