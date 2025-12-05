# Sections Principales des Fichiers Exécutables (ELF)

Ce document décrit les sections importantes trouvées dans les binaires (fichiers objets ou exécutables) sous les systèmes d'exploitation de type Unix/Linux (format ELF).

## Sections d'Exécution et de Données

| Section | Description | Rôle |
| :--- | :--- | :--- |
| **`.text`** | Contient le **code machine** compilé du programme (les instructions CPU). | Le cœur du programme exécutable. |
| **`.data`** | Contient les **variables globales et statiques initialisées** avec des valeurs non nulles. | Données modifiables (lecture/écriture). |
| **`.rodata`** | Contient les **données en lecture seule**, comme les chaînes de caractères littérales ou les constantes. | Données non modifiables (lecture seule). |
| **`.bss`** | Contient les **variables globales et statiques non initialisées** ou initialisées à zéro. | Ne prend pas d'espace dans le fichier, mais est allouée en mémoire lors de l'exécution. |

## Sections de Liaison et Métadonnées

| Section | Description | Rôle |
| :--- | :--- | :--- |
| **`.symtab`** | **Table des symboles**. Liste tous les noms (variables, fonctions) dans le fichier. | Utilisée par le lieur pour résoudre les références entre fichiers. |
| **`.strtab`** | **Table des chaînes de caractères** associée à `.symtab`. Contient les noms des symboles. | Sert de stockage pour les chaînes de noms de symboles. |
| **`.got.plt`** | **Global Offset Table / Procedure Linkage Table**. Pointeur pour les appels de fonctions externes et les variables dynamiques. | Essentiel pour le **lien dynamique** avec les bibliothèques partagées. |
| **`.dynamic`** | Contient les informations nécessaires pour le **chargeur dynamique** du système. | Liste les bibliothèques nécessaires et les tables de liaison. |

## Sections de Débogage

| Section | Description | Rôle |
| :--- | :--- | :--- |
| **`.debug_info`** | Contient la description détaillée des variables, des types de données et de la structure du code source. | Utilisée par les outils de débogage comme GDB. |
| **`.debug_line`** | Table de correspondance entre les adresses d'exécution dans `.text` et les numéros de ligne du fichier source original. | Permet au débogueur de suivre l'exécution ligne par ligne. |
