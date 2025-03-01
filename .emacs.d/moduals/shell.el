(if (string= (shell-command-to-string "grep -q NixOS /etc/os-release && echo yes || echo no") "yes\n")
    (progn
      (setq explicit-shell-file-name "/run/current-system/sw/bin/bash")
      (setq explicit-bash-args '("--login" "-i"))
      (setq term-shell "/run/current-system/sw/bin/bash")
      (setq shell-file-name "/run/current-system/sw/bin/bash"))
  (progn
    (setq explicit-shell-file-name "/usr/bin/bash")
    (setq explicit-bash-args '("--login" "-i"))
    (setq term-shell "/usr/bin/bash")
    (setq shell-file-name "/usr/bin/bash")))
