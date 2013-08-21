nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/conf.d/devops.conf
      - file: /etc/nginx/conf.d/default.conf

/etc/nginx/conf.d/devops.conf:
  file:
    - managed
    - source: salt://nginx/devops.conf

/etc/nginx/conf.d/default.conf:
  file.absent
