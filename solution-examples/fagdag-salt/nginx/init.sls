nginx:
  pkg:
    - installed
  service: 
    - running
    - require:
      - pkg: nginx
    - watch: 
      - file: nginxconf

nginxconf:
  file.managed:
    - name: /etc/nginx/sites-enabled/default
    - source: salt://nginx/nginx.conf
    - template: jinja
    - makedirs: True
    - mode: 755

