---
layout: page
permalink: /outreach/
title: Outreach
description: Outreach to society and science dissemination activities.
nav: true
nav_order: 4
---

{% assign pinned_outreach = site.outreach | where: "pinned", true %}
{% assign other_outreach = site.outreach | where_exp: "item", "item.pinned != true" | where_exp: "item", "item.position != 'last'" | sort: "start_date" | reverse %}
{% assign last_outreach = site.outreach | where: "position", "last" | sort: "start_date" | reverse %}
{% assign sorted_outreach = pinned_outreach | concat: other_outreach | concat: last_outreach %}

<!-- Generate cards -->

<div class="projects">
<div class="container">
<div class="row row-cols-1 row-cols-md-2">
{% for project in sorted_outreach %}
  {% include projects_horizontal.liquid variant="outreach" %}
{% endfor %}
</div>
</div>
</div>