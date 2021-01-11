;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nat Tuck"
      user-mail-address "nat@ferrus.net")

(if (string-equal (system-name) "icewing")
    (setq doom-font (font-spec :family "Hack" :size 22)
          doom-variable-pitch-font (font-spec :family "DejaVu Sans")
          doom-unicode-font (font-spec :family "DejaVu Sans Mono")
          doom-big-font (font-spec :family "Hack" :size 28)))

(if (string-equal (system-name) "greyarea")
    (setq doom-font (font-spec :family "Hack" :size 36)
          doom-variable-pitch-font (font-spec :family "DejaVu Sans")
          doom-unicode-font (font-spec :family "DejaVu Sans Mono")
          doom-big-font (font-spec :family "Hack" :size 40)))

(if (string-equal (system-name) "celedyr")
    (setq doom-font (font-spec :family "Hack" :size 20)
          doom-variable-pitch-font (font-spec :family "DejaVu Sans")
          doom-unicode-font (font-spec :family "DejaVu Sans Mono")
          doom-big-font (font-spec :family "Hack" :size 26)))

(if (string-equal (system-name) "rabbit")
    (setq doom-font (font-spec :family "Hack" :size 20)
          doom-variable-pitch-font (font-spec :family "DejaVu Sans")
          doom-unicode-font (font-spec :family "DejaVu Sans Mono")
          doom-big-font (font-spec :family "Hack" :size 26)))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Sync/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(define-key evil-normal-state-map "Q" 'fill-paragraph)

(defun liu233w/ex-kill-buffer-and-close ()
  (interactive)
  (unless (char-equal (elt (buffer-name) 0) ?*)
    (kill-this-buffer))
  )

(defun liu233w/ex-save-kill-buffer-and-close ()
  (interactive)
  (save-buffer)
  (kill-this-buffer)
  )

(evil-ex-define-cmd "q[uit]" 'liu233w/ex-kill-buffer-and-close)
(evil-ex-define-cmd "wq" 'liu233w/ex-save-kill-buffer-and-close)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq ivy-use-virtual-buffers nil)
(with-eval-after-load 'recentf
  (setq ivy-use-virtual-buffers nil))

(defun my-web-mode-hook ()
  "Fix web mode nonsense"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-expanding nil)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-enable-auto-closing nil)
  (setq web-mode-enable-auto-pairing nil))
(add-hook 'web-mode-hook  'my-web-mode-hook)
