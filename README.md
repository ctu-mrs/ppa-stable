# PPA Unstable

Personal Package Archive (PPA) for unstable MRS deb packages.

```bash
curl https://ctu-mrs.github.io/ppa-unstable/add_ppa.sh | bash
```

## Uninstalling packages from this PPA

```bash
sudo apt-get -y install aptitude
sudo apt remove $(aptitude search -F '%p' '~S ~i ?origin("ctu-mrs") ?label("unstable")')
```
