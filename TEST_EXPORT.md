# 🧪 Test de l'export d'archive

## Comment tester et voir les messages de debug

### Option 1 : Relancer Merlinator en mode visible (RECOMMANDÉ)

1. **Arrêter l'instance actuelle** :
```bash
pkill -f merlinator.py
```

2. **Relancer depuis le terminal** (pour voir les logs) :
```bash
cd /Users/yannick/Projects/merlinator/src
/opt/homebrew/bin/python3.11 merlinator.py
```

3. **Dans Merlinator** :
   - Fichier → Nouvelle session
   - Ajouter des sons (Nouveau Son)
   - Fichier → Exporter archive
   - **Regarder le terminal** : vous devriez voir :
     ```
     📦 Export vers ZIP - Nombre d'items: X
     📝 Écriture de playlist.bin...
     ✓ playlist.bin créé avec succès
     ```

### Option 2 : Vérifier le contenu du ZIP

Sans regarder les logs, vous pouvez directement vérifier :

```bash
# Après avoir exporté une archive (ex: merlin.zip)
unzip -l ~/Downloads/merlin.zip

# Vous devriez voir :
# - playlist.bin  ⭐ (le fichier clé)
# - *.mp3         (vos fichiers audio)
# - *.jpg         (les vignettes)
```

### Option 3 : Utiliser la commande zipinfo

```bash
zipinfo ~/Downloads/merlin.zip
```

## 📋 Checklist de test

- [ ] Fichier → Nouvelle session
- [ ] Ajouter au moins 1 son (Nouveau Son)
- [ ] Fichier → Exporter archive (Ctrl+X)
- [ ] Sauvegarder le ZIP
- [ ] Vérifier le contenu :
  ```bash
  unzip -l chemin/vers/votre/archive.zip
  ```

## ✅ Résultat attendu

Vous devriez voir quelque chose comme :

```
Archive:  merlin.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
    12345  10-17-2024 16:40   playlist.bin        ⭐
  3456789  10-17-2024 16:40   kR3tPxW9nQ2mL8v...mp3
    16384  10-17-2024 16:40   kR3tPxW9nQ2mL8v...jpg
---------                     -------
  3485518                     3 files
```

## 🐛 Si playlist.bin est absent

Cela signifie qu'une erreur s'est produite. Les logs devraient montrer :

```
❌ Erreur lors de la création de playlist.bin: [message d'erreur]
[Traceback complet]
```

Partagez-moi le message d'erreur complet pour que je puisse corriger !

