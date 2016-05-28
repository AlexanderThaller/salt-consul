{% from 'consul/map.jinja' import lookup %}
{% set datamap = salt['pillar.get']('consul') %}

consul.config:
  file.managed:
    - name: '{{ salt['file.join'](lookup.config_dir, 'consul.json') }}'
    - source: 'salt://consul/files/config'
    - makedirs: True
    - template: 'jinja'
