1. Installer Chef på egen maskin 

2. Registrer gratis Hosted Chef-konto hos Opscode. 

3. Opprett organisasjon hos Opscode

4. Last ned private keys for både organisasjonen og deg selv, samt knife config og legg inn i prosjekt-repoet ditt

5. Sjekk at oppsettet funker med ```knife client list``` 

6. Legg inn noen pakker med ```knife cookbook site install [package_name]```

7. Last opp cookbooksene til Chef Server med ```knife cookbook upload -a```

8. Bootstrap en node med ```knife bootstrap```


Oppsummering:

* Server-klient modell. Kan sette opp Chef server selv, eller la Opscode hoste serveren via produktet Hosted chef

* Sette opp cookbooks og recipes i repo på utviklermaskin

* Laster opp cookbooks til Chef server vha. verktøyet Knife

* Bruker knife for å bootstrappe en node. Kjører kommando med hostnavn, passord og "run-list" som angir hvilke cookbooks som skal kjøres på noden

* Knife bootstrap laster ned Chef-klient på noden og kjører all magi for å provisjonere opp noden.

* Senere runs kan initieres med knife bootstrap eller ved å kjøre "chef-client" på noden.

* Endringer i hva en node skal ha kan entes gjøres ved "knife bootstrap --run_list ..." eller "knife node run_list add [cookbook]" + chef-client run på noden

* "knife cookbook site install -b <branch>" vil laste ned en cookbook fra Chef community i en egen chef-vendor-<cookbook> branch og merge inn i <branch>. 
  Du kan gjøre endringer i cookbooken selv og commite til eget repo, og så merge inn endringer fra vendor-branchen når du måtte ønske.
