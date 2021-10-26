---
{{ $name := replace .Name "-" " " }}
title: "{{ $name | title }}"
date: {{ .Date }}
draft: false
scss: {{ printf "frontend-mentor/%s/style.scss" .Name }}
js: {{ printf "frontend-mentor/%s/script.js" .Name }}
layout: {{ .Name }}
---

Dear diary, my experience pixel fucking for {{ $name }}
...
