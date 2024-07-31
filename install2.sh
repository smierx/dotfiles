alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:smierx/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
rm .bashrc
rm install.sh
rm install2.sh
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
source .bashrc
rm -rf luarocks-3.11.1
rm luarocks-3.11.1-tar.gz
rm nvim-linux64.tar.gz
rm lazygit

declare -a arr=("git@github.com:smierx/digitaldatachainweedfarmechternhagen.git"
                "git@github.com:smierx/zeiterfassung_backend.git"
                "git@github.com:smierx/anki_cli.git"
                "git@github.com:smierx/qmk_firmware.git"
                "git@github.com:smierx/pipelines.git"
                "git@github.com:smierx/templates.git"
                )

for i in "${arr[@]}"
do
  git clone "$i"
done
