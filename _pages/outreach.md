---
layout: page
permalink: /outreach/
title: Science Outreach
description: Outreach to society and science dissemination activities.
nav: true
nav_order: 7
---

{% assign sorted_outreach = site.outreach | sort: "importance" %}

  <!-- Generate cards for each project -->

<div class="container">
<div class="row row-cols-1 row-cols-md-2">
{% for project in sorted_outreach %}
  {% include projects_horizontal.liquid %}
{% endfor %}
</div>
</div>