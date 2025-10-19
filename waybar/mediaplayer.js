import * as childProcess from "node:child_process";

/**
 * @param {string} command
 */
const runCommand = (command) => {
  const result = childProcess.execSync(command);
  return String(result).trim();
};

/**
 * @param {string} command
 */
const runCommandOrEmpty = (command) => {
  try {
    return runCommand(command);
  } catch {
    return "";
  }
};

const isSpotifyRunning = () => runCommandOrEmpty("pgrep spotify") !== "";

/**
 * @readonly
 * @enum {"Playing" | "Paused"}
 */
const PlayerStatus = {
  PLAYING: "Playing",
  PAUSED: "Paused",
};

/**
 * @readonly
 * @enum {"spotify" | "telegram"}
 */
const PlayerName = {
  SPOTIFY: "spotify",
  TELEGRAM: "telegram",
};

/**
 * @readonly
 * @enum {"spotify" | "TelegramDesktop"}
 */
const PlayerCliName = {
  SPOTIFY: "spotify",
  TELEGRAM: "TelegramDesktop",
};

/**
 * @readonly
 * @type {PlayerCliName[]}
 */
const players = ["spotify", "TelegramDesktop"];

/**
 * @typedef SongInfo
 * @property {string} artist
 * @property {string} title
 * @property {string} album
 */

class Player {
  /**
   * @type {PlayerName}
   */
  name = isSpotifyRunning() ? PlayerName.SPOTIFY : PlayerName.TELEGRAM;

  getCurrentStatus() {
    return runCommand(`playerctl --player=${players} status`);
  }

  getCurrentSongArtist() {
    return runCommandOrEmpty(`playerctl --player=${players} metadata xesam:artist`);
  }

  getCurrentSongTitle() {
    return runCommandOrEmpty(`playerctl --player=${players} metadata xesam:title`);
  }

  getCurrentSongAlbum() {
    return runCommandOrEmpty(`playerctl --player=${players} metadata xesam:album`);
  }

  /**
   * @returns {SongInfo}
   */
  getCurrentSong() {
    return {
      artist: this.getCurrentSongArtist(),
      title: this.getCurrentSongTitle(),
      album: this.getCurrentSongAlbum(),
    };
  }
}

/**
 * @readonly
 * @enum {"playing" | "paused"}
 */
const WaybarAltStatus = {
  PLAYING: "playing",
  PAUSED: "paused",
};

class Renderer {
  /**
   * @param {Player} player
   */
  constructor(player) {
    this.player = player;
  }

  /**
   * @param {PlayerStatus} status
   * @returns {string}
   */
  getAlt(status) {
    const name = this.player.name;
    return status === PlayerStatus.PLAYING ? `${name}-${WaybarAltStatus.PLAYING}` : `${name}-${WaybarAltStatus.PAUSED}`;
  }

  /**
   * @param {SongInfo} song
   * @returns {string}
   */
  getDescription(song) {
    return `Artist:
${song.artist}

Song:
${song.title}

Album:
${song.album}`;
  }

  getCssClass() {
    return this.player.name;
  }

  getData() {
    const song = this.player.getCurrentSong();
    const status = this.player.getCurrentStatus();
    const data = {
      text: `${song.artist} - ${song.title}`,
      alt: this.getAlt(status),
      tooltip: this.getDescription(song),
      class: this.getCssClass(),
      percentage: 50,
    };

    return data;
  }

  render() {
    const data = this.getData();
    console.log(JSON.stringify(data));
  }
}

const main = () => {
  const player = new Player();
  const renderer = new Renderer(player);
  renderer.render();

  setInterval(() => {
    renderer.render();
  }, 2_000);
};

main();
