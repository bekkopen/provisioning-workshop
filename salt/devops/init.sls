devops:
  user.present:
    - createhome: True
    - shell: /bin/bash
    - password: $6$SALTsalt$ZcYv6WOnmaS0V9w4QHCQHYYg0QnFQQHnIdgR.pCh8OySsVXlS0/oWfPx8600uTbMgNKFJMEoLx8YiDGuYt0cH1

java:
  pkg.installed:
    - name: java-1.6.0-openjdk

/etc/init.d/devops:
  file.managed:
    - source: salt://devops/devops
    - user: root
    - group: root
    - mode: 755
    - require:
      - pkg: java
