---
{{ $name := replace .Name "-" " " }}
title: "{{ $name | title }}"
date: {{ .Date }}
draft: false
scss: {{ printf "%s/style.scss" .Name }}
js: {{ printf "%s/script.js" .Name }}
layout: {{ .Name }}
---

Dear diary, my experience pixel fucking for {{ $name }}
...
