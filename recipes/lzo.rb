include_recipe "pivotal_workstation::homebrew"

unless brew_installed? "lzo"
  brew_install "lzo"
end