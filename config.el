;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; GENERAL CONFIG

(setq user-full-name "Aspen Price"
      user-mail-address "aspen@aspen-otr.com")

(setq doom-font (font-spec :family "Agave Nerd Font" :size 24)
      doom-variable-pitch-font (font-spec :family "NotoSerif Nerd Font Propo" :size 23))

(setq doom-theme 'doom-opera)
(setq display-line-numbers-type t)

(map! :leader :desc "Find directory here" :nv "fj" #'dired-jump)
(setq dired-listing-switches "-agho --group-directories-first")

;; ORG

(setq org-directory "~/org/")

;; C

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; TYPST

(defun +typst-ts-open-pdf ()
  (interactive)
  (if-let* ((fname (buffer-file-name))
            (pdf (file-name-with-extension fname "pdf")))
      (browse-url pdf)))

(with-eval-after-load 'typst-ts-mode
  (add-to-list 'typst-ts-mode-hook #'electric-pair-local-mode)
  (map! :localleader :map 'typst-ts-mode-map
        :desc "Toggle Watch Mode" :nv "w" #'typst-ts-watch-mode
        :desc "Open PDF" :nv "p" #'+typst-ts-open-pdf))

;; ELISP

(map! :localleader :mode (emacs-lisp-mode) :nm "ef" #'eros-eval-defun)
