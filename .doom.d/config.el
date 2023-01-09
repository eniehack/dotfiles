;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nakaya"
      user-mail-address "eniehack@outlook.jp")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "HackGenConsoleNF" :size 14)
      doom-variable-pitch-font (font-spec :family "HackGenConsoleNF")
      doom-unicode-font (font-spec :family "HackGenConsoleNF")
      doom-big-font (font-spec :family "HackGenConsoleNF" :size 22))

(if-let ((dir (getenv "XDG_RUNTIME_DIR")))
    (setq server-socket-dir (file-name-concat dir "emacs"))
  (setq server-socket-dir (locate-user-emacs-file "")))

  ;; If you use `org' and don't want your org files in the default location below,
  ;; change `org-directory'. It must be set before org loads!
  ;; (require 'org-protocol)
(setq org-directory "~/orgmodes/")
(setq org-default-notes-file "notes.org")
(defun transform-square=brackets-to-round-ones(string-to-transform)
  ;; "transforms brackets into parentheses"
  (concat
   (mapcar #'(lambda (c) (if (equal c ?\[) ?\( (if (equal c ?\]) ?\) c))) string-to-transform)))

(after! org-capture
  ;;(setq org-dir "~/orgmodes/")
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "~/orgmodes/notes.org" "Inbox")
           "** %U %?\n")
          ("t" "todo" entry (file+headline "~/orgmodes/todo.org" "Inbox")
           "** TODO %T %??\n")
          ("l" "protocol with link" entry (file+headline "~/orgmodes/notes.org" "Inbox")
           "* [[%:link][%(transform-square=brackets-to-round-ones \"%:description\")]]\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
          ("q" "protocol with quote" entry (file+headline "~/orgmodes/notes.org" "Inbox")
           "* %:description\n:PROPERTIES:\n:CREATED: %U\n:END:\n#+BEGIN_QUOTE\n%i\n#+END_QUOTE\n[[%:link][%(transform-square=brackets-to-round-ones \"%:description\")]]\n%?"))))

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

(when (eq system-type 'windows-nt)
  (progn
    (let* ((msys2-root "c:/msys64")
           (msys2-bin (concat msys2-root "/usr/bin"))
           (msys2-ucrt-bin (concat msys2-root "/ucrt64/bin")))

      (setq exec-path (nconc exec-path `(msys2-bin msys2-ucrt-bin)))
      (setenv "PATH"
              (concat msys2-bin ";" msys2-ucrt-bin ";" (getenv "PATH")))
      (after! ediff
        :config
        (let* ((msys-root "C:/msys64")
               (msys-bin (concat msys-root "/usr/bin")))
          (setq ediff-diff-program (concat msys-bin "/diff.exe"))
          (setq ediff-diff3-program (concat msys-bin "/diff3.exe"))
          (setq ediff-patch-program (concat msys-bin "/patch.exe")))
        (setq ediff-diff-options "-w")))
    (setq org-plantuml-jar-path
          (expand-file-name (concat (getenv "HOME") "/scoop/apps/plantuml/1.2021.13/plantuml.jar")))
    (set-clipboard-coding-system 'utf-16-le)
    (set-default-coding-systems 'utf-8-unix)
    (w32-set-system-coding-system 'utf-8-dos)
    (setq default-directory
          (concat (getenv "HOME") "/"))))

;; typenovel.el
(defvar typenovel-command "npx tnc")

(defun typenovel-mode/typenovel-compile ()
  (interactive)
  (progn
    (message "Compiling '%s'" buffer-file-name)
    (async-shell-command (format "%s %s\n" typenovel-command buffer-file-name))))

(define-generic-mode typenovel-mode
  '("//" ("/*" . "*/"))
  nil
  '(("@[a-zA-Z]+[a-zA-Z0-9-_]*" . font-lock-keyword-face)
    ("$[a-zA-Z]+[a-zA-Z0-9-_]*" . font-lock-variable-name-face))
  nil
  nil
  "Major mode for TypeNovel")
(add-to-list 'auto-mode-alist '("\\.tn$" . typenovel-mode))

;; orgmode - LaTeX
(after! ox-latex
  (progn
    (setq org-latex-compiler "lualatex")
    (setq org-latex-default-class "jlreq")
    (add-to-list 'org-latex-packages-alist '("" "graphicx"))
    (add-to-list 'org-latex-packages-alist '("" "here"))
    (add-to-list 'org-latex-classes
                 '("jlreq"
                   "\\documentclass{jlreq}
[NO-DEFAULT-PACKAGES]
\\jlreqsetup{}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (defvar org-latex-pdf-process '("cluttex -e lualatex %f"))
    (defvar org-file-apps-gnu '(("pdf" . "llpp %s")))))

;; (use-package! uim-leim
;;   :when (eq system-type 'gnu/linux)
;;   :config
;;   (setq default-input-method "japanese-skk-uim")
;;   (setq uim-lang-code-alist
;;         (cons '("Japanese" "Japanese" utf-8 "UTF-8")
;;               (delete (assoc "Japanese" uim-lang-code-alist)
;;                       uim-lang-code-alist))))

(after! skk
  (setq default-input-method "japanese-skk")
  (map! "C-x C-j" #'skk-mode)
  (map! :map evil-org-mode-map
        :after evil-org
        :i "C-j" #'skk-kakutei))

(after! doom-modeline
  (progn
    (setq doom-modeline-continuous-word-count-modes
          `(markdown-mode gfm-mode org-mode))
    (setq doom-modeline-buffer-encoding t)
    (setq doom-modeline-buffer-state-icon nil)
    (setq doom-modeline-lsp t)
    (setq doom-modeline-icon (display-graphic-p))))

(after! (:and lsp-mode vala-mode)
  :when (eq system-type 'windows-nt)
  :config
  (setq lsp-clients-vala-ls-executable "C:\\msys64\\ucrt64\\bin\\vala-language-server.exe"))

(use-package! meson-mode
  :hook (meson-mode . company-mode))

(after! (:and lsp-mode racer)
  :when (eq system-type 'windows-nt)
  :config
  (setq lsp-rust-server 'rls)
  (setq lsp-rust-rls-server-command "C:\\msys64\\ucrt64\\bin\\rls.exe"))

(after! (:and eglot racer)
  :config
  (set-eglot-client! 'rust-mode `("rls")))

(after! (:and eglot crystal-mode)
  (add-to-list 'eglot-server-programs '(crystal-mode . ("crystalline")))
  (add-hook 'crystal-mode 'eglot-ensure))

(after! (:and eglot svelte-mode)
  (add-to-list 'eglot-server-programs '(svelte-mode . ("svelteserver" "--stdio")))
  (add-hook 'svelte-mode 'eglot-ensure))

;; (after! (:and lsp-mode crystal-mode)
;;   (progn
;;     (add-to-list 'lsp-language-id-configuration
;;                  '(crystal-mode . "crystal"))
;;     (lsp-register-client
;;      (make-lsp-client :new-connection
;;                       (lsp-stdio-connection '("crystalline"))
;;                       :activation-fn (lsp-activate-on "crystal")
;;                       :priority '1
;;                       :server-id `crystalline))))

;; (after! (:and lsp-mode svelte-mode)
;;     (add-to-list 'lsp-language-id-configuration
;;                  '(svelte-mode . "svelte"))
;;     (lsp-register-client
;;      (make-lsp-client :new-connection
;;                       (lsp-stdio-connection '("svelteserver" "--stdio"))
;;                       :activation-fn (lsp-activate-on "svelte")
;;                       :priority '1
;;                       :server-id 'svelteserver)))
(after! org-alert
  (add-hook 'org-agenda-mode-hook 'org-alert-enable)
  (setq alert-default-style 'libnotify))

(after! org-journal
  (setq org-journal-date-format "%Y-%m-%d")
  (setq org-journal-time-format "%R\n\n")
  (setq org-journal-file-format "journal-%Y-%m.org")
  (setq org-journal-file-type 'weekly)
  (setq org-journal-dir "~/orgmodes/")

  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    (unless (eq org-journal-file-type 'daily)
      (org-narrow-to-subtree))
    (goto-char (point-max)))
  (setq org-capture-templates (cons '("j" "Journal entry" plain (function org-journal-find-location)
                                 "** %(format-time-string org-journal-time-format)%\n%i%?"
                                 :jump-to-captured t :immediate-finish t)  org-capture-templates))
  ;; (add-to-list org-capture-templates '(("j" "Journal entry" plain (function org-journal-find-location)
  ;;                                "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
  ;;                                :jump-to-captured t :immediate-finish t)))
  )
