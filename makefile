all: README.md

README.md: guessinggame.sh
	   echo "# Guessing Game" > README.md
	   echo "" >> README.md
	   echo "Projet : jeu de devinettes en Bash (nombre de fichiers du répertoire courant)." >> README.md
	   echo "" >> README.md
	   echo "- **Date et heure d'exécution de make :** $$(date '+%Y-%m-%d %H:%M:%S')" >> README.md
	   echo "- **Nombre de lignes de code dans guessinggame.sh :** $$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md

clean:
	   rm -f README.md

.PHONY: all clean
