A Hugo site for displaying my frontend-mentor challenge solutions.
Download a challenge zip and place it in exercises/ then cd exercises && ./install.sh 'challenge-name'.

This will:
- unzip the challenge
- create the following infrastructure
  - layouts/partial/$challenge.html (full html + template tags around !! TODO: should extract body)
  - assets/$challenge/{script.js,style.scss} (empty files, creating them is the challenge)
  - content/$challenge.md 
  - static/$challenge/{images,design,solution}/

script.js and style.scss are automatically included in rendering the .html
in static/"excercise-name"/solution are symlinks to all necessary files for the exercise
