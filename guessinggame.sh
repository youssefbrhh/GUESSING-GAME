#!/usr/bin/env bash
# guessinggame.sh - Jeu : devinez le nombre de fichiers du répertoire courant

# Compte les fichiers (hors sous-répertoires) du répertoire courant, fichiers cachés inclus
count_files() {
    find . -maxdepth 1 -type f | wc -l
}

# Lit une réponse et vérifie qu'il s'agit d'un entier positif
read_guess() {
    local answer
    while true; do
        read -p "Votre estimation : " answer
        if [[ "$answer" =~ ^[0-9]+$ ]]; then
            echo "$answer"
            return
        fi
        echo "Veuillez saisir un nombre entier positif." >&2
    done
}

actual=$(count_files)

echo "Bienvenue dans le jeu des devinettes !"
echo "Combien de fichiers se trouvent dans le répertoire actuel ?"

while true; do
    guess=$(read_guess)
    if [[ $guess -lt $actual ]]; then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $actual ]]; then
        echo "Trop haut ! Essayez encore."
    else
        echo "Félicitations ! Il y a bien $actual fichiers dans ce répertoire."
        break
    fi
done

echo "Merci d'avoir joué. À bientôt !"
