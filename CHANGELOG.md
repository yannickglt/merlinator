# Changelog - Merlinator

## Version améliorée (Octobre 2024)

### ✨ Nouvelles fonctionnalités

#### 🔐 Nommage par hash des fichiers
- **Les fichiers MP3 et JPG sont maintenant nommés avec un hash SHA-256 en base64**
  - Hash basé sur le **contenu** du fichier (garantit l'unicité)
  - Compatible avec tous les systèmes de fichiers (base64 URL-safe)
  - Limite automatique à 64 octets (compatible Merlin)
  - **Avantages** :
    - ✅ Plus de conflits de noms de fichiers
    - ✅ Plus de problèmes avec les caractères spéciaux/accents
    - ✅ Détection automatique des doublons
    - ✅ Noms toujours valides pour Merlin
  
- **Affichage conservé** : Le nom original du fichier reste visible dans l'interface

#### 🎨 Extraction automatique des vignettes MP3
- Extraction automatique de la pochette d'album lors de l'ajout d'un son
- Redimensionnement automatique à 128x128 pixels
- Format JPEG non-progressif (compatible Merlin)
- Nommage cohérent : l'image porte le même hash que le MP3

### 🐛 Corrections de bugs

#### Export ZIP vide
- **Corrigé** : Variable `file_not_found` manquante → `files_not_found`
- **Corrigé** : Initialisation de `playlistpath` manquante
- **Corrigé** : Gestion des chemins lors de nouvelle session

#### Compatibilité
- Remplacement de `Image.ANTIALIAS` (déprécié) → `Image.LANCZOS`
- Support amélioré pour Python 3.11 avec Homebrew
- Gestion gracieuse de l'absence de pygame (audio optionnel)

### 🔧 Améliorations techniques

#### Système de hash
```python
# Exemple de hash généré (SHA-256 en base64 URL-safe)
# Fichier: mon_histoire.mp3
# Hash: kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w

# Fichiers générés dans le ZIP:
# - kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.mp3
# - kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.jpg
```

#### Performance
- Hash calculé par chunks (4096 octets) pour gérer les gros fichiers
- Pas de copie des fichiers originaux (économie d'espace)
- Export ZIP optimisé

### 📝 Notes de migration

Si vous avez des playlists existantes :
- Les anciens fichiers avec noms originaux fonctionnent toujours
- Les nouveaux fichiers ajoutés utilisent le système de hash
- Lors du prochain export ZIP, tous les fichiers seront inclus correctement

### 🎯 Flux de travail recommandé

1. **Ajout de contenu** :
   - Cliquez sur "Nouveau Son"
   - Sélectionnez votre MP3
   - ✨ Le hash est généré automatiquement
   - ✨ La vignette est extraite automatiquement

2. **Export pour Merlin** :
   - Fichier → Exporter archive (Ctrl+X)
   - Les fichiers sont automatiquement nommés avec le hash
   - Décompressez sur la carte SD Merlin

3. **Sauvegarde de travail** :
   - Fichier → Sauver session (Ctrl+S)
   - Format JSON avec tous les paramètres

