# NAOP

## Notes sur git

Aller dans mon dossier de travail

```
cd /Users/oslive/Desktop/code/NAOP
```

regarder sur quelle branche je suis

```
git branch
```

créer une nouvelle branche: exemple une feature (fonctionnalité) qu'on veut tester ou travailler :

```
git branch feature/ma-nouvelle-feature
```

regarder le statut de ma branche  
regarder les changements que j'ai fait et qui ne sont pas commités (staged)

```
git status
```

commiter tous les fichiers modifiés :

```
git add .
git commit -m "explication de mes changements"
```

commiter seulement un ou N fichiers:

```
git add nom-fichier.1.pde nom-fichier2.pde
git commit -m "explication de mes changements"
git status
```

chaque branche que je crée, met à jour, etc. sur mon ordinateur local, peut avoir un équivalent
sur github : c'est ce qu'on appelle la "branche distante". Si tu veux travailler avec d'autres personnes
et aussi pas perdre ton code en cas d'accident, il faut que ta branche distante soit mise à jour avec ta branche locale.

pusher mon nouveau commit sur ma branche develop distante (origin)

!! attention, git ne te laissera pas pusher ton code sur une branche distante si celle-ci est en avance sur la tienne. Ce qui veut dire que si entre le moment ou tu as fait un "pull" de develop et le moment ou tu "commit" sur develop ton travail - qqn d'autre à fait un "commit" (qu'il a pushé sur develop) alors git va te jeter si tu fais un "push" sans avoir fait un "pull" d'abord

```
git push origin develop
```

récupérer les changements qu'un autre developper (guillaume, etc) à apporté à la branche distante : exemple develop

fetch permet de récupérer les changements ayant eu lieu sur origin (github) et ce sur n'importe qu'elle branche

pull permet de récupérer les changements ayant eu lieu sur origin (github) et de les merger dans ma branche local : !! attention il peut y avoir des conflits parfois --> dans ce cas il faut les résoudre.

```
git checkout develop
git status
git fetch
git pull origin develop
```

## Méthodologie et utilisation de git

1. ma branche main c'est ma version la plus aboutie stable : je peux l'utiliser en démo, devant mes clients, etc.

2. ma branche develop c'est ma branche de travail qui idéalement est également relativement stable

3. quand je travaille sur une nouvelle fonctionnalité, je crée une branche de "feature" - exemple feature/improve-interpolation et une fois que je pense que mon travail est stable, je merge ma branche feature dans deveop

4. Une fois que ma branche develop est stable, je la merge dans le main.

5. Plusieurs developpeurs, peuvent bosser en parallèle sur le projet en utilisant si possible des branches différentes.

6. Idéalement il y a une seule personne référene qui décide de merger develop dans master.
