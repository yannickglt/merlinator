# Installation de Merlinator

## Prérequis

- macOS avec Homebrew installé
- Python 3.11 avec support tkinter

## Installation

### 1. Installer Python 3.11 via Homebrew

```bash
brew install python@3.11
brew install python-tk@3.11
```

### 2. Installer les dépendances Python

```bash
/opt/homebrew/bin/pip3.11 install -r requirements.txt
```

## Lancement

### Option 1 : Via le script de lancement (recommandé)

```bash
./run_merlinator.sh
```

### Option 2 : Manuellement

```bash
cd src
/opt/homebrew/bin/python3.11 merlinator.py
```

## Notes

- Le support audio (pygame) est désactivé sur macOS 15 build 1506 en raison d'incompatibilités
- L'application fonctionne parfaitement sans le support audio
- Toutes les fonctionnalités d'édition de playlist sont disponibles

