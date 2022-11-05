# Pinball FX Launcher 
A Launch Autohotkey script for pinball FX that adds per table launching support. Plus a collection of docklet wheel images that go with it

## Release / Help Video
[![Pinball FX Launcher V1.0 Helper Video](http://img.youtube.com/vi/_XECsVwUTlI/0.jpg)](https://youtu.be/_XECsVwUTlI "Pinball FX Launcher V1.0 Helper Video")

## Cabinet setup pinball X

### Pinball X Settings 
compile the provided script to an EXE and make sure it's working then use these settings:
<IMG src="meta/pinballxsetings.png"/>

### Launch before & After script
You will need a launch before to run some program to rotate your screen to portrait mode. I personally use irotate

Launch before (bat):
```
powershell -Command "Start-Process 'irotate.exe' '/2:rotate=90 /exit' -Verb runAs -WorkingDirectory 'C:\Program Files (x86)\iRotate\'"
```

Launch After (bat):
```
powershell -Command "Start-Process 'irotate.exe' '/2:rotate=0 /exit' -Verb runAs -WorkingDirectory 'C:\Program Files (x86)\iRotate\'"
```

#credits:
- Docklet logo's are taken randomly from internet and what i had on my pinball cabinet for pinball FX3
- Docklet images themselves mostly come from the backglasses from this url https://www.dropbox.com/sh/l4so158sh8s2ewx/AACO7ZCV5LAOw2I_fORzspZ5a/Cabinet?dl=0&subfolder_nav_tracking=1 (you can also use these for your pinball FX setup)
- Docklet template comes from pinball x forums from the zaccaria docklet wheel topic
- script uses eval function made by Pulover [Rodolfo U. Batista] and by Uberi (ExprEval())
