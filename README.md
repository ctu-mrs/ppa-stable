# PPA stable

Personal Package Archive (PPA) for stable MRS deb packages.

```bash
curl https://ctu-mrs.github.io/ppa-stable/add_ppa.sh | bash
```

## Uninstalling packages from this PPA

```bash
sudo apt-get -y install aptitude
sudo apt remove $(aptitude search -F '%p' '~S ~i ?origin("ctu-mrs") ?label("stable")')
```
