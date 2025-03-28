# Ping checker

Allows you to kick players with high ping

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/ping-checker/releases)
* Extract `plugins` and `translations` folders to `addons/sourcemod` folder of your server

### Console Variables

* sm_pingchecker_max_ping - Maximum ping [default: "150"]
* sm_pingchecker_max_warnings - The number of warnings after which the player will be kicked [default: "3"]
* sm_pingchecker_interval - How often to check the ping (in seconds) [default: "10", minimum: "3"]
* sm_pingchecker_logging - Enable (1) or disable (0) logging [default: "1"]

### API

Called when checking the `client`

> Return `Plugin_Stop` to ignore the `client` and other actions to continue

```sourcepawn
forward Action PingChecker_OnClient(int client);
```
