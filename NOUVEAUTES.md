# Nouvelles fonctionnalités de Merlinator

## 🎨 Extraction automatique des vignettes MP3

### Description
Lorsque vous ajoutez un nouveau son via le bouton **"Nouveau Son"**, Merlinator tente maintenant automatiquement d'extraire la pochette d'album (album art) intégrée dans le fichier MP3.

### Fonctionnement automatique

1. **Ajout d'un son** : Cliquez sur "Nouveau Son" et sélectionnez un fichier MP3
2. **Extraction automatique** : 
   - Si le MP3 contient une pochette d'album, elle est automatiquement extraite
   - L'image est redimensionnée à **128x128 pixels** (format requis par la Merlin)
   - L'image est sauvegardée au format **JPEG non-progressif** (compatible Merlin)
   - Le fichier JPG est nommé automatiquement comme le MP3 (ex: `histoire.mp3` → `histoire.jpg`)
3. **Association automatique** : La vignette est immédiatement associée au son dans l'interface

### Avantages

✅ **Gain de temps** : Plus besoin d'extraire manuellement les images  
✅ **Format garanti** : Respect automatique des contraintes Merlin (128x128, JPEG baseline)  
✅ **Nom cohérent** : L'image porte automatiquement le même nom que le MP3  
✅ **Intégration fluide** : L'image apparaît instantanément dans l'interface

### Comportement

- **Vignette trouvée** : ✓ Message de confirmation dans la console  
- **Pas de vignette** : L'opération se déroule silencieusement, vous pouvez toujours ajouter une image manuellement via "Changer image"

### Compatibilité

- Nécessite la bibliothèque `mutagen` (déjà installée avec les dépendances)
- Fonctionne avec tous les formats de pochettes MP3 standards (ID3v2)
- Compatible avec les images JPEG, PNG, etc. (automatiquement converties en JPEG)

### Notes techniques

- Les images sont converties en RGB si nécessaire
- Qualité JPEG : 85% (bon compromis qualité/taille)
- Redimensionnement : méthode LANCZOS (haute qualité)
- Format : JPEG baseline (non-progressif) pour compatibilité maximale avec toutes les versions de Merlin

---

*Cette fonctionnalité a été ajoutée pour simplifier l'ajout de contenu dans votre enceinte Merlin.*

