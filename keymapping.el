;;; keymapping.el -*- lexical-binding: t; -*-

;; ==================================================
;; Mapeamentos de teclas equivalentes
;; ==================================================

;; Salvar arquivo (C-s)
(map! :i "C-s" #'save-buffer
      :n "C-s" #'save-buffer
      :v "C-s" #'save-buffer)

;; Fechar buffer (leader kb)
(map! :leader
      :desc "Kill buffer" :n "k b" #'kill-this-buffer
      :desc "Kill buffer" :v "k b" #'kill-this-buffer)

;; Habilita movimento com M-hjkl no modo de inserção
(after! evil
  (map! :map evil-insert-state-map
        "M-h" #'evil-backward-char
        "M-j" #'evil-next-line
        "M-k" #'evil-previous-line
        "M-l" #'evil-forward-char))

;; Funções auxiliares
(defun local/evil-open-below-and-exit ()
  "Abre linha abaixo, sai do modo inserção e move para cima"
  (interactive)
  (evil-open-below 1)
  (evil-normal-state)
  (evil-previous-line))

(defun local/evil-open-above-and-exit ()
  "Abre linha acima, sai do modo inserção e move para baixo"
  (interactive)
  (evil-open-above 1)
  (evil-normal-state)
  (evil-next-line))

;; Configuração principal
(after! evil
  ;; Modo Normal
  (map! :n "M-o" #'local/evil-open-below-and-exit
        :n "M-O" #'local/evil-open-above-and-exit)

  ;; Modo Inserção
  (map! :i "M-o" (kbd "C-e RET C-p")
        :i "M-O" (kbd "C-a RET")))

;; ==================================================
;; Configurações adicionais recomendadas
;; ==================================================

;; Comportamento de fechar buffer mais inteligente
(setq +doom-quit-on-close-buffer-p t)

;; Alternar buffers ignorando buffers especiais
(setq doom-scratch-buffer-major-mode 'org-mode)

;; Função melhorada para alternar buffers (CORRIGIDA)
(defun local/switch-to-next-buffer ()
  "Switch to next non-special buffer."
  (interactive)
  (next-buffer)
  (while (string-match-p "^\\*" (buffer-name))
    (next-buffer)))

(defun local/switch-to-previous-buffer ()
  "Switch to previous non-special buffer."
  (interactive)
  (previous-buffer)
  (while (string-match-p "^\\*" (buffer-name))
    (previous-buffer)))

;; Atribuir às teclas
(map! :n "C-n" #'local/switch-to-next-buffer
      :n "C-p" #'local/switch-to-previous-buffer)
