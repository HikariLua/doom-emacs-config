;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load! "org.el")
(load! "keymapping.el")

(defun evil-save-on-exit ()
"Salva o buffer se for um arquivo e se foi modificado."
(when (and (buffer-file-name)
        (buffer-modified-p)
        (not buffer-read-only))
(save-buffer)))

(after! evil
  ;; Salvar automaticamente ao entrar no modo Normal
  (add-hook 'evil-normal-state-entry-hook #'evil-save-on-exit))
