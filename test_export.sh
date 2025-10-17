#!/bin/bash
# Script de test pour vérifier l'export d'archive

echo "🧪 Test de l'export Merlinator"
echo "================================"
echo ""

# Chercher le dernier ZIP créé dans les emplacements communs
LOCATIONS=(
    "$HOME/Downloads"
    "$HOME/Desktop"
    "$HOME/Documents"
    "/Users/yannick/Downloads"
    "/Users/yannick/Desktop"
)

LATEST_ZIP=""
LATEST_TIME=0

echo "🔍 Recherche du dernier fichier ZIP exporté..."
for location in "${LOCATIONS[@]}"; do
    if [ -d "$location" ]; then
        while IFS= read -r -d '' file; do
            if [ -f "$file" ]; then
                file_time=$(stat -f %m "$file" 2>/dev/null)
                if [ "$file_time" -gt "$LATEST_TIME" ]; then
                    LATEST_TIME=$file_time
                    LATEST_ZIP="$file"
                fi
            fi
        done < <(find "$location" -maxdepth 1 -name "*.zip" -print0 2>/dev/null)
    fi
done

if [ -z "$LATEST_ZIP" ]; then
    echo "❌ Aucun fichier ZIP trouvé"
    echo ""
    echo "💡 Pour tester :"
    echo "   1. Dans Merlinator : Fichier → Exporter archive"
    echo "   2. Sauvegarder le ZIP"
    echo "   3. Relancer ce script : ./test_export.sh"
    exit 1
fi

echo "✓ ZIP trouvé : $LATEST_ZIP"
echo ""

# Vérifier le contenu
echo "📦 Contenu de l'archive :"
echo "-------------------------"
unzip -l "$LATEST_ZIP"

echo ""
echo "🔍 Vérification des fichiers requis :"
echo "-------------------------------------"

# Vérifier playlist.bin
if unzip -l "$LATEST_ZIP" | grep -q "playlist.bin"; then
    echo "✅ playlist.bin présent"
else
    echo "❌ playlist.bin ABSENT (PROBLÈME !)"
fi

# Compter les MP3
MP3_COUNT=$(unzip -l "$LATEST_ZIP" | grep -c "\.mp3$" || echo "0")
echo "📀 Fichiers MP3 : $MP3_COUNT"

# Compter les JPG
JPG_COUNT=$(unzip -l "$LATEST_ZIP" | grep -c "\.jpg$" || echo "0")
echo "🖼️  Fichiers JPG : $JPG_COUNT"

echo ""
echo "================================"
if unzip -l "$LATEST_ZIP" | grep -q "playlist.bin"; then
    echo "✅ Export OK : L'archive semble correcte"
else
    echo "⚠️  ATTENTION : playlist.bin manquant !"
    echo ""
    echo "💡 Que faire :"
    echo "   1. Relancer Merlinator en mode debug :"
    echo "      cd src && /opt/homebrew/bin/python3.11 merlinator.py"
    echo "   2. Refaire l'export"
    echo "   3. Regarder les messages dans le terminal"
fi

