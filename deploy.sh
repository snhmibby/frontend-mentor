#!/bin/sh
hugo && rsync -avz --delete public/ jurjen.dev:~/frontend-mentor.jurjen.dev
