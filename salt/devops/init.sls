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
      - file: /devops/devops.jar

/devops/devops.jar:
  file.managed:
    - source: salt://devops/devops.jar
    - user: devops
    - group: devops
    - mode: 755

install_devops_service:
  cmd.run:
    - name: 'chkconfig --add devops && chkconfig devops on && service devops start'
    - user: root
    - group: root
