---
layout: page
permalink: /outreach/
title: Outreach
description: Outreach to society and science dissemination activities.
nav: true
nav_order: 4
---

{% assign sorted_outreach = site.outreach | sort: "start_date" | reverse %}

<!-- Generate cards -->

<div class="container">
<div class="row row-cols-1 row-cols-md-3">
{% for project in sorted_outreach %}
  {% include projects.liquid %}
{% endfor %}
</div>
</div>