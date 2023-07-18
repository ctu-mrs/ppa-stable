# PPA Unstable

Personal Package Archive (PPA) for unstable MRS deb packages.

```bash
curl -s --compressed "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/ctu-mrs.list "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs.list"
sudo curl -s --compressed -o /etc/ros/rosdep/sources.list.d/ctu-mrs.list "https://ctu-mrs.github.io/ppa-unstable/rosdep/30-ctu-mrs.list"
sudo curl -s --compressed -o /etc/apt/preferences.d/ctu-mrs-ppa-preferences "https://ctu-mrs.github.io/ppa-stable/rosdep/ctu-mrs-ppa-preferences.txt"
sudo apt update
rosdep update
```

## Uninstalling packages from this PPA

```bash
sudo apt-get -y install aptitude
sudo apt remove $(aptitude search -F '%p' '~S ~i ?origin("ctu-mrs") ?label("unstable")')
```
