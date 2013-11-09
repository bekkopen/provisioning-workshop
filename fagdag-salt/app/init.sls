/home/devops/devops:
  file.managed:
    - source: salt://../serverfiler/devops
    - mode: 755

/home/devops/devops.jar:
  file.managed:
    - source: salt://../serverfiler/devops.jar
    - mode: 755

app:
  cmd.run:
    - name: /home/devops/devops restart
    - cwd: /home/devops
    - watch: 
      - file: /home/devops/devops
      - file: /home/devops/devops.jar
