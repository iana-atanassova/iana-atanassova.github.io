# Guide des modifications du site

Site personnel construit avec Jekyll, thème [al-folio](https://github.com/alshedivat/al-folio) et jekyll-scholar.
Déploiement automatique sur GitHub Pages à chaque `git push` sur `main` (workflow `.github/workflows/jekyll.yml`).

---

## 1. Sources de vérité

| Contenu | Fichier à modifier | Remarque |
|---|---|---|
| Publications (site **et** CV PDF) | `CV-latex/iana-all.bib` | **Ne jamais modifier** `_bibliography/iana-all-html.bib` : il est régénéré par `compile.sh`. |
| Contenu du CV PDF (FR + EN) | `CV-latex/content.tex` | Bilingue : chaque texte s'écrit `\en{...}\fr{...}`. |
| Page web `/cv/` | `_pages/cv.md` | Contient seulement les liens vers les deux PDF de `assets/pdf/`. |
| Présentation (page d'accueil) | `_pages/about.md` | Sous-titre (affiliations) dans le front matter `subtitle`. |
| Actualités | `_news/AAAA-MM-JJ-slug.md` | Visibles sur `/news/` uniquement (rubrique retirée de l'accueil, réactivable par `announcements: enabled: true` dans `about.md`). |
| Projets | `_projects/AAAA-slug.md` | Catégories : voir §4. |
| Diffusion scientifique | `_outreach/AAAA-slug.md` | Page en construction (cartes d'exemple). |
| Identifiants (HAL, ORCID, Scholar…) | `_data/socials.yml` | |
| Réglages généraux | `_config.yml` | Titre, description, regroupement des publications (`scholar:`). |
| Images | `assets/img/` | Converties automatiquement en webp (imagemagick). |
| PDF (CV, offres…) | `assets/pdf/` | Les CV y sont copiés par `compile.sh`. |

---

## 2. Ajouter une publication

1. Ajouter l'entrée BibTeX dans **`CV-latex/iana-all.bib`** (JabRef ou éditeur de texte).
2. Vérifier les champs obligatoires et les conventions :
   - `year = {AAAA}` **obligatoire** (JabRef écrit parfois `date` : corriger en `year`) ;
   - `doi = {10.xxxx/...}` **sans** le préfixe `https://doi.org/` ;
   - clé du type `NomAAAAx` (ex. `Ningrum2025b`), unique.
3. Champs pour le **CV PDF** :
   - `annotation = {...}` — une seule valeur parmi :

     | Valeur | Rubrique du CV |
     |---|---|
     | `revue-com-lecture` | Articles dans des revues à comité de lecture |
     | `chapitre` | Chapitres d'ouvrages |
     | `dir-num-revue` | Direction de numéros de revue |
     | `dir-actes` | Direction d'actes |
     | `conf-invitee` | Conférences invitées |
     | `conf-internat` | Colloques internationaux avec actes |
     | `conf-nat` | Colloques nationaux avec actes |
     | `comm-sans-actes` | Communications sans actes |
     | `seminaire` | Séminaires |
     | `vulgarisation` | Diffusion scientifique |
     | `dataset` | Jeux de données |
     | `these` | Thèse (rubrique actuellement commentée) |
     | `rapport` | Rapports |

     Une entrée sans `annotation` valide **n'apparaît pas** dans le CV PDF.
   - `author+an = {3=me;1=student}` : position des auteurs ; `me` → gras, `student` → souligné.
4. Champs pour le **site web** (facultatifs) :
   - `abstract = {...}`
   - `bibtex_show = {true}` : bouton « Bib »
   - `selected = {true}` : publication affichée dans « Selected Publications » sur l'accueil
   - `preview = {fichier.png}` : vignette, fichier placé dans `assets/img/` (préférer un fichier local à une URL externe)
   - `pdf`, `slides`, `poster`, `code`, `video`, `website` : liens complémentaires
5. Lancer `compile.sh` (§6) : il régénère les PDF **et** `_bibliography/iana-all-html.bib`.
6. Facultatif : annoncer la publication par une actualité (§3), avec un lien `/publications/#CleBibtex`.

---

## 3. Ajouter une actualité

Créer `_news/AAAA-MM-JJ-slug.md` (date sur deux chiffres, ex. `2026-11-20-these-xxx.md`).

**Annonce courte** (affichée en entier dans la liste) :

```markdown
---
layout: post
date: 2026-11-20
inline: true
related_posts: false
---

Texte court de l'annonce, avec éventuellement un <a href="https://..." target="_blank">lien</a>.
```

**Annonce longue** (titre cliquable vers une page dédiée) :

```markdown
---
layout: post
title: Titre de l'annonce
date: 2026-11-20
inline: false
related_posts: false
---

Texte développé. Images : placer le fichier dans `assets/img/news/` et l'insérer avec
<img src="/assets/img/news/fichier.png" class="img-fluid rounded" alt="description">
```

Le site est en anglais (`lang: en`) : rédiger les actualités en anglais.

---

## 4. Ajouter un projet

Créer `_projects/AAAA-slug.md` :

```markdown
---
layout: page
title: ACRONYME - Titre court
description: Sous-titre, AAAA-AAAA
img: assets/img/acronyme.png
importance: 1            # ordre d'affichage dans la catégorie (1 = en premier)
category: PI of Funded Projects
related_publications: false
---

Objectifs, financement (organisme, référence), partenaires, lien vers le site du projet.
```

Catégories affichées (liste `display_categories` de `_pages/projects.md`) :
`PI of Funded Projects`, `Participant in Funded Projects`.
Pour une nouvelle catégorie, l'ajouter aussi à cette liste ; sinon la carte n'apparaît pas.
Mettre aussi à jour la rubrique « Projets de recherche » de `CV-latex/content.tex`.

---

## 5. Thèses, jurys, cours, responsabilités

Ces éléments sont gérés dans `CV-latex/content.tex` uniquement (les pages Teaching et Service ont été retirées du site pour l'instant).

| Élément | Section de `content.tex` | Macro |
|---|---|---|
| Direction de thèse | `PhD thesis supervision` | `\datedelement{Nom}{}{\en{"Title", funding}\fr{"Titre", financement}}{AAAA--}` |
| Encadrement postdoctoral | `Post-doctoral supervision` | `\datedline{Dr Nom}{\en{...}\fr{...}}{MM/AAAA--MM/AAAA}` |
| Mémoires de Master | `MSc thesis supervision` | `\datedline{Initiale. Nom, ...}{}{AAAA}` |
| Jury de thèse | `Participation in PhD thesis jurys` | `\datedelement{Nom}{"Titre"}{Établissement, pays}{AAAA}` (sous « rapporteure » ou « examinatrice ») |
| Comités de suivi | `Participation in PhD thesis supervision committees` | liste en ligne |
| Responsabilités | `Institutional responsibilities` | `\datedelementdatefirst{MM/AAAA--}{\en{...}\fr{...}}{}{Établissement}` |
| Évaluation, éditorial | `Evaluation panels`, `Editorial work` | `\datedelementdatefirst{...}` |
| Enseignement | `Teaching activity` | `\datedelementdatefirst{...}` |

Rappels : toujours remplir **les deux langues** ; accorder au féminin en français (directrice, examinatrice, membre élue…) ; entrées en ordre antichronologique.

---

## 6. Compiler le CV

```bash
cd CV-latex
./compile.sh
```

Le script :
1. compile `CV_Iana_Atanassova_fr.tex` et `CV_Iana_Atanassova_en.tex` (même contenu `content.tex`, la langue est choisie par `\versionFr` / `\versionEn`) ;
2. affiche avertissements et erreurs LaTeX ;
3. s'il n'y a pas d'erreur, copie les PDF dans `assets/pdf/` ;
4. convertit `iana-all.bib` en `iana-all-html.bib` (`\textsuperscript{}` → `<sup>`) et le copie dans `_bibliography/`.

---

## 7. Prévisualiser puis publier

Prévisualisation locale (facultative) :

```bash
bundle exec jekyll serve     # puis ouvrir http://localhost:4000
```

Publication :

```bash
git pull
git status                    # vérifier les fichiers modifiés
git add -A
git commit -m "Ajout : <description>"
git push                      # déclenche le déploiement GitHub Actions
```

Suivre le déploiement dans l'onglet **Actions** du dépôt GitHub (quelques minutes). En cas d'échec, l'erreur Jekyll s'y affiche (souvent : BibTeX mal formé ou front matter YAML invalide).

---

## 8. Vérifications périodiques

- Cohérence `CV-latex/content.tex` ↔ `_pages/about.md` ↔ `_data/socials.yml` (postes, affiliations, adresse électronique).
- Affiliations du sous-titre (`_pages/about.md`) et de l'en-tête du CV à jour.
- Offres (postdoc, stages) arrivées à échéance : signaler la clôture dans l'actualité.
- PDF du CV en ligne plus anciens que `content.tex` ou `iana-all.bib` : relancer `compile.sh`.
