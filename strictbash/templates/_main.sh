...
install_bfg_via_curl() {
  if [[ ! -f bin/bfg-1.13.0.jar ]]; then
    mkdir -p bin
    ...
}

main() {
  if [[ "${PART}" == "bash" ]]; then
    install_tools_via_packages
    install_screenkey_via_git
    install_bfg_via_curl
    backup_regular_file_and_stow bash
    source "${HOME}/.bashrc"
  elif [[ "${PART}" == "tmux" ]]; then
    install_tpm_via_git
    backup_regular_file_and_stow tmux
  fi
}

main
