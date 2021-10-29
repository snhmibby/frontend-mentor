A Hugo site for displaying my frontend-mentor exercise solutions.
Download a exercise zip and place it in exercises/ then cd exercises && ./install.sh 'challenge-name'.

This will:
- unzip the challenge
- create the following infrastructure
  - layouts/partial/$exercise.html (full html + template tags around !! TODO: should extract body)
  - assets/$exercise/{script.js,style.scss} (empty files, creating them is the exercise)
  - content/$exercise.md 
  - static/$exercise/{images,design,solution}/
    images and design folders are copied from the zip file
    solution folder contains symlinks to the hugo layout-template and the .js/.scss page assets.

script.js and style.scss are automatically included in rendering the .html
in static/"excercise-name"/solution are symlinks to all necessary files for the exercise, for sharing/examination.
