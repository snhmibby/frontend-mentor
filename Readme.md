Another Hugo site for displaying my frontend-mentor challenge solutions.
Download a challenge zip and place it in challenges/ then run ./challenge.sh install 'challenge-name'

And it will:
- unzip the challenge
- create the following infrastructure
  - layouts/partial/$challenge.html (empty !! TODO: should extract body)
  - assets/$challenge/{script.js,style.scss} (empty files, creating them is the challenge)
  - content/challenge/$challenge.md (copies the readme)
  - static/$challenge/

script.js and style.scss are automatically included in rendering the .html

To open all associated files do ./challenge.sh run 'challenge-name'
