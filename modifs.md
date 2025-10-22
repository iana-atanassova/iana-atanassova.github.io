# Guide des modifications

- Iana - sept 2025

## Structure

- _config.yml : general settings

- _pages/about.md : biography (short)
- _pages/cv.md : config. of the CV, points to the pdf cv file
- assets/pdf/CV_Iana_Atanassova_main.pdf : cv in pdf
- assets/resume.json : contents of the CV

- _data/socials.yml : websites ids (orcid etc)

- _bibliography/iana-all.bib  : bibliography file





## Modifications


### Add publications

Add to _bibliography/iana-all.bib


Bibtex fields :

preview = {link to image file}
abstract = {abstract}
bibtex_show = {true}
selected = {true}
poster = {link to poster}
slides = {link to presentation}

### Add news 
 
- Add file to _news 
Structure: 
```
---
layout: post
date: 2015-10-22 15:59:00-0400
inline: true
related_posts: false
---

A simple inline announcement.
```


ou 

```
---
layout: post
title: A long announcement with details
date: 2015-11-07 16:11:00-0400
inline: false
related_posts: false
---

Announcements and news can be much longer than just quick inline posts. In fact, they can have all the features available for the standard blog posts. See below.

---

Jean shorts raw denim ... brunch. <a href="https://www.pinterest.com">Pinterest</a>
#### Hipster list

<ul>
    <li>brunch</li>
    <li>fixie</li>
    <li>raybans</li>
    <li>messenger bag</li>
</ul>


---

> We do not grow absolutely, chronologically. We grow sometimes in one dimension, and not in another, unevenly. We grow partially. We are relative. We are mature in one realm, childish in another.
> —Anais Nin

```


### Modify CV

- in assets/pdf: place the new PDF file
- in assets/resume.json


### Add identified (HAL etc.)

_data/socials.yml

