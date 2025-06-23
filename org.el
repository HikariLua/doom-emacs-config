;;; org.el -*- lexical-binding: t; -*-

;; ==================================================
;; Configuração ESSENCIAL para ícones (REVISADA)
;; ==================================================

(use-package! org-superstar
  :hook (org-mode . org-superstar-mode)  ;; ATIVAÇÃO DIRETA SEM HOOK ADICIONAL
  :config
  (setq org-superstar-headline-bullets-list '("❤" "❀" "✿" "❁" "✾" "❃" "❋")
        org-superstar-item-bullet-alist '((?+ . "💖") (?- . "💗") (?* . "💘"))
        org-superstar-todo-bullet-alist '(("TODO" . ?✨) ("DONE" . ?💅))
        org-superstar-prettify-item-bullets t
        org-superstar-special-todo-items t
        org-superstar-restart t))  ;; CRÍTICO PARA MULTIPLOS ARQUIVOS

;; ==================================================
;; Configuração do Org Mode (REVISADA)
;; ==================================================
(after! org
  ;; Configurações básicas
  (setq org-ellipsis " ▾"
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-fontify-whole-heading-line t
        org-startup-with-inline-images t)  ;; ATIVAR IMAGENS POR PADRÃO

  ;; TODO keywords com emojis
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "WAIT" "|" "DONE" "CANC")))

  ;; Configurações para garantir que os ícones apareçam
  (setq org-hide-leading-stars nil
        org-indent-mode-turns-on-hiding-stars nil
        org-adapt-indentation nil
        org-use-sub-superscripts nil)  ;; MELHOR COMPATIBILIDADE

  ;; Fonte variável
  (add-hook 'org-mode-hook #'mixed-pitch-mode)
  (setq mixed-pitch-set-height t))

;; ==================================================
;; Cores pastéis suaves
;; ==================================================
(custom-set-faces!
  `(org-level-1 :foreground "#FFB3BA" :weight bold :height 1.2)
  `(org-level-2 :foreground "#FFDFBA" :weight bold :height 1.15)
  `(org-level-3 :foreground "#FFFFBA" :weight bold :height 1.1)
  `(org-level-4 :foreground "#BAFFC9" :weight bold :height 1.05)
  `(org-level-5 :foreground "#BAE1FF" :weight bold)
  `(org-level-6 :foreground "#E0BBFF" :weight bold)
  `(org-document-title :foreground "#FFB3BA" :weight bold :height 1.4)
  `(org-checkbox :foreground "#FFB3BA" :weight bold)
  `(org-date :foreground "#C1C1C1")
  `(org-list-item :foreground "#BAFFC9")
  `(org-todo :foreground "#FFB3BA" :weight bold)
  `(org-done :foreground "#BAFFC9" :weight bold))

;; Fonte variável
(set-face-attribute 'variable-pitch nil :family "Arial" :height 130)

;; ==================================================
;; Configurações de rolagem e visual-fill-column
;; ==================================================
(when (display-graphic-p)
  (pixel-scroll-mode 1)
  (setq pixel-scroll-precision-mode t))

(defun local/org-mode-visual-fill ()
  (setq visual-fill-column-width 110
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package! visual-fill-column
  :hook (org-mode . local/org-mode-visual-fill))

;; ==================================================
;; Configurações gerais (REVISADAS)
;; ==================================================
(setq doom-theme 'doom-vibrant)
(add-hook 'window-setup-hook #'doom/reload-font)
(setq display-line-numbers-type t)
(setq org-directory "~/hikari.d/notes/org/")
