{% from 'consul/map.jinja' import lookup %}

consul.pkgs:
  pkg.installed:
    - pkgs: {{ lookup.pkgs }}
