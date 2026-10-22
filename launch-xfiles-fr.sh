#!/usr/bin/env bash
# Shiloh French DVD launcher — no game files included.
set -euo pipefail

usage() {
  printf 'Usage: %s <DVD_mount_or_extracted_root> [path_to_xf]\n' "$0"
  printf 'Example: %s /mnt/xfiles-test "$HOME/Jeux/Shiloh/shiloh-v0.3.0-linux-x86_64/xf"\n' "$0"
}
if [[ ${1:-} == '-h' || ${1:-} == '--help' ]]; then usage; exit 0; fi
if (( $# < 1 || $# > 2 )); then usage >&2; exit 2; fi
root="${1%/}"
if [[ -d "$root/Francais" ]]; then root="$root/Francais"; fi
if [[ ! -d "$root/MININST" || ! -d "$root/MEDINST" ]]; then
  echo 'Erreur : dossiers MININST/MEDINST introuvables dans le DVD français.' >&2
  exit 1
fi
if [[ ! -f "$root/MININST/XFILES.HDB" || ! -f "$root/MININST/XFILES.GAM" ]]; then
  echo 'Erreur : fichiers essentiels XFILES.HDB/GAM introuvables dans MININST.' >&2
  exit 1
fi
xf="${2:-$HOME/Jeux/Shiloh/shiloh-v0.3.0-linux-x86_64/xf}"
if [[ ! -x "$xf" ]]; then echo "Erreur : exécutable Shiloh introuvable ou non exécutable : $xf" >&2; exit 1; fi
exec "$xf" --data "$root/MININST" --data "$root/MEDINST" --data "$root"
