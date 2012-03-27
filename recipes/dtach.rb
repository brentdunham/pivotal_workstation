include_recipe "pivotal_workstation::homebrew"

unless brew_installed? "dtach"
  brew_install "dtach"
end