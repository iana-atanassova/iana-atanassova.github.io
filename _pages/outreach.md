---
layout: page
permalink: /outreach/
title: Outreach
description: Outreach to society and science dissemination activities.
nav: true
nav_order: 4
---

{% assign pinned_outreach = site.outreach | where: "pinned", true %}
{% assign other_outreach = site.outreach | where_exp: "item", "item.pinned != true" | sort: "start_date" | reverse %}
{% assign sorted_outreach = pinned_outreach | concat: other_outreach %}

<!-- Generate cards -->

<div class="container">
<div class="row row-cols-1 row-cols-md-3">
{% for project in sorted_outreach %}
  {% include projects.liquid %}
{% endfor %}
</div>
</div>