{% from 'consul/map.jinja' import lookup %}

consul.service:
  service.running:
    - name: {{ lookup.service }}
    - enable: True
    - require:
      - pkg: 'consul.pkgs'
    - watch:
      - file: 'consul.config'
      - file: '{{ salt['file.join'](lookup.config_dir, '*') }}'
