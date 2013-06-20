1. Installer Chef på egen maskin 

2. Registrer gratis Hosted Chef-konto hos Opscode. 

3. Opprett organisasjon hos Opscode

4. Last ned private keys for både organisasjonen og deg selv, samt knife config og legg inn i prosjekt-repoet ditt

5. Sjekk at oppsettet funker med ```knife client list``` 

6. Legg inn noen pakker med ```knife cookbook site install [package_name]```

7. Last opp cookbooksene til Chef Server med ```knife cookbook upload -a```

8. Bootstrap en node med ```knife bootstrap```


