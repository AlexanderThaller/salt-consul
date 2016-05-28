{% from 'consul/map.jinja' import lookup %}

consul.pkgs:
  pkg.installed:
    - pkgs: {{ lookup.pkgs }}

{% if salt['grains.get']('os_family') == "FreeBSD" %}
consul.rc_file:
  file.managed:
    - name: '{{ salt['file.join'](lookup.rc_path, 'consul') }}'
    - source: 'salt://consul/files/rc.FreeBSD'
    - mode: '0755'
{% endif %}
