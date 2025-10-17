# 🔐 Système de nommage par hash

## Pourquoi utiliser des hash ?

### ❌ Problèmes avec les noms de fichiers classiques

```
histoire_du_petit_chaperon_rouge_version_longue_2024.mp3
└─> Trop long (> 64 octets) ❌
└─> Caractères accentués problématiques ❌
└─> Risque de conflits/doublons ❌

café_du_matin.mp3
└─> Accents incompatibles avec certains systèmes ❌

mon histoire.mp3
└─> Espaces peuvent causer des problèmes ❌
```

### ✅ Solution : Hash SHA-256 en base64

```
Fichier source: "Histoire du Petit Chaperon Rouge.mp3"
                ↓
         [Calcul SHA-256]
                ↓
       [Encodage base64 URL-safe]
                ↓
Nom final: "kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w"
```

## Comment ça marche ?

### 1. Ajout d'un fichier MP3

```
Vous ajoutez:  mon_histoire.mp3
                    ↓
Merlinator calcule: SHA-256(contenu du fichier)
                    ↓
Génère le hash:     "kR3tPxW9nQ2mL8vY..."
                    ↓
Fichiers créés:     kR3tPxW9nQ2mL8vY....mp3
                    kR3tPxW9nQ2mL8vY....jpg (vignette)
                    ↓
Affichage dans      ♪ mon_histoire
l'interface:        (nom original conservé!)
```

### 2. Dans le ZIP d'export

```
merlin.zip
├── playlist.bin
├── kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.mp3
├── kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.jpg
├── aB2cD3eF4gH5iJ6kL7mN8oP9qR0sT1uV2wX3yZ4aB5cD6eF7gH8iJ.mp3
├── aB2cD3eF4gH5iJ6kL7mN8oP9qR0sT1uV2wX3yZ4aB5cD6eF7gH8iJ.jpg
└── ...
```

## Avantages techniques

### 🎯 Unicité garantie
- Même contenu = même hash
- Contenu différent = hash différent
- **Détection automatique des doublons**

### 🌍 Compatibilité universelle
- Base64 URL-safe : seulement `A-Z`, `a-z`, `0-9`, `-`, `_`
- Pas d'accents, pas d'espaces, pas de caractères spéciaux
- Fonctionne sur **tous** les systèmes de fichiers

### 📏 Longueur contrôlée
- Hash limité à 64 octets maximum
- Compatible avec les restrictions de Merlin
- Plus de problème de "nom trop long"

### 🔒 Intégrité des fichiers
- Le hash change si le fichier est modifié
- Permet de vérifier l'intégrité des fichiers
- Utile pour la déduplication

## Exemples concrets

### Fichier identique = même hash

```bash
# Vous ajoutez deux fois le même fichier (même contenu)
histoire.mp3     → kR3tPxW9nQ2m...
histoire_v2.mp3  → kR3tPxW9nQ2m... (même hash!)
                   └─> Merlinator détecte le doublon
```

### Fichier différent = hash différent

```bash
# Deux fichiers différents
histoire_v1.mp3 → kR3tPxW9nQ2m...
histoire_v2.mp3 → aB2cD3eF4gH5... (hash différent)
```

## FAQ

### Q: Puis-je toujours voir le nom original ?
**R:** Oui ! Le nom original est affiché dans l'interface. Seul le nom de fichier final utilise le hash.

### Q: Que se passe-t-il si j'ajoute le même MP3 deux fois ?
**R:** Les deux entrées auront le même hash. Dans le ZIP, le fichier ne sera stocké qu'une fois (dédoublonnage automatique).

### Q: Le hash est-il toujours le même pour un fichier ?
**R:** Oui ! Tant que le contenu du fichier ne change pas, le hash reste identique.

### Q: Et les anciennes playlists ?
**R:** Elles fonctionnent toujours ! Seuls les nouveaux fichiers utilisent le système de hash.

### Q: Puis-je personnaliser le nom affiché ?
**R:** Oui ! Utilisez le champ "Titre" pour modifier le nom affiché dans l'interface et sur la Merlin.

## Exemple de hash complet

```
Fichier source:
  Nom:     Le_Petit_Prince_Chapitre_1.mp3
  Taille:  3.5 MB
  
Hash généré (SHA-256 en base64 URL-safe):
  kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w

Fichiers dans le ZIP:
  ✓ kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.mp3
  ✓ kR3tPxW9nQ2mL8vY5jZaB1cD4eF6gH7iJ8kL9mN0oP1qR2sT3uV4w.jpg
  
Affichage dans Merlinator:
  ♪ Le_Petit_Prince_Chapitre_1

Titre sur la Merlin:
  Le_Petit_Prince_Chapitre_1 (modifiable dans l'interface)
```

---

**Note** : Ce système garantit que vos fichiers seront toujours compatibles avec la Merlin, quel que soit leur nom original !

