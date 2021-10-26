---
{{ $name := replace .Name "-" " " }}
title: "{{ $name | title }}"
date: {{ .Date }}
draft: false
SCSS: {{ printf "frontend-mentor/%s/style.scss" .Name }}
JS: {{ printf "frontend-mentor/%s/script.js" .Name }}
---

Dear diary, my experience pixel fucking for {{ $name }}
...
