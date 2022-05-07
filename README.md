# ⛺️ Tipi — A personal homeserver for everyone
[![License](https://img.shields.io/github/license/meienberger/runtipi)](https://github.com/meienberger/runtipi/blob/master/LICENSE)
[![Version](https://img.shields.io/github/v/release/meienberger/runtipi?color=%235351FB&label=version)](https://github.com/meienberger/runtipi/releases)
![RunsOn](https://img.shields.io/badge/Debian-Supported-green?logo=debian)
![RunsOn](https://img.shields.io/badge/Ubuntu-Supported-green?logo=ubuntu)

![Preview](https://raw.githubusercontent.com/meienberger/runtipi/develop/screenshots/1.png)
> ⚠️ Tipi is still at an early stage of development and issues are to be expected. Feel free to open an issue or pull request if you find a bug.

Tipi is a personal homeserver orchestrator. It is running docker containers under the hood and provides a simple web interface to manage them. Every service comes with an opinionated configuration in order to remove the need for manual configuration and network setup.

## Apps available
- [Anonaddy](https://github.com/anonaddy/anonaddy) - Anonymous email forwarding
- [Filebrowser](https://github.com/filebrowser/filebrowser) - Web File Browser
- [Freshrss](https://github.com/FreshRSS/FreshRSS) - A free, self-hostable RSS aggregator
- [Invidious](https://github.com/iv-org/invidious) - An alternative front-end to YouTube
- [Jackett](https://github.com/Jackett/Jackett) - API Support for your favorite torrent trackers
- [Jellyfin](https://github.com/jellyfin/jellyfin) - A media server for your home collection
- [Joplin](https://github.com/laurent22/joplin) - Privacy focused note-taking app
- [n8n](https://github.com/n8n-io/n8n) - Workflow Automation Tool
- [Nextcloud](https://github.com/nextcloud/server) - A safe home for all your data
- [Pihole](https://github.com/pi-hole/pi-hole) - A black hole for Internet advertisements
- [Radarr](https://github.com/Radarr/Radarr) - Movie collection manager for Usenet and BitTorrent users.
- [Sonarr](https://github.com/Sonarr/Sonarr) - TV show manager for Usenet and BitTorrent
- [Syncthing](https://github.com/syncthing/syncthing) - Continuous File Synchronization
- [Tailscale](https://github.com/tailscale/tailscale) - The easiest, most secure way to use WireGuard and 2FA.
- [Transmission](https://github.com/transmission/transmission) - Fast, easy, and free BitTorrent client
- [Wireguard Easy](https://github.com/WeeJeWel/wg-easy) - WireGuard VPN + Web-based Admin UI
## 🛠 Installation
### Installation Requirements
- Ubuntu 18.04 LTS or higher (or Debian 10)

Make sure your User ID is `1000` (verify it by running `id -u`) and ensure that your account is [correctly permissioned to use docker](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).

### Step 1. Download Tipi
Run this in an empty directory where you want to install Tipi.

```bash
git clone https://github.com/meienberger/runtipi.git
```

### Step 2. Run Tipi
cd into the downloaded directory and run the start script.

```bash
cd runtipi && sudo ./scripts/start.sh
```

The script will prompt you the ip address of the dashboard once configured.

To stop Tipi, run the stop script.

```bash
sudo ./scripts/stop.sh
```

## ❤️ Contributing

Tipi is made to be very easy to plug in new apps. We welcome and appreciate new contributions.

If you want to support a new app or feature, you can:
- Fork the repository and create a new branch for your changes.
- Create a pull request.

## 📜 License
[![License](https://img.shields.io/github/license/meienberger/runtipi)](https://github.com/meienberger/runtipi/blob/master/LICENSE)

Tipi is licensed under the GNU General Public License v3.0. TL;DR — You may copy, distribute and modify the software as long as you track changes/dates in source files. Any modifications to or software including (via compiler) GPL-licensed code must also be made available under the GPL along with build & install instructions.