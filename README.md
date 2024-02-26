# Script MPV pour affichage de l'heure de fin d'une vidéo

## Fonctionnement

Indique l'heure à laquelle se termine une vidéo lorsque celle-ci est mise en pause.

## Installation

- Linux: Copier le script dans le chemin suivant: ```~/.config/mpv/scripts/```. Si le dossier "scripts " n'existe pas, il suffit de le créer

### Pour les utilisateurs de SMPlayer

- Il faut forcer le chargement du script en allant dans ```Options > Préférences > Avancé > MPlayer/mpv > Options pour MPlayer/mpv```
- Dans la zone ```options``` ajouter le contenu suivant: ```--script="~/.config/mpv/scripts/pause.lua"```