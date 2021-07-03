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
(setq doom-theme 'doom-nord)

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

;; (after! org-protocol
;;   (progn
;;     (add-to-list 'org-capture-templates
;;                  `(("l" "protocol with link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;                     "* [[%:link][%:(transform-square=brackets-to-round-ones \"%:description\")]]\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
;;                    ))
;;     (add-to-list 'org-capture-templates
;;                  `(("q" "protocol with quote" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;                     "* %:description\n:PROPERTIES:\n:CREATED: %U\n:END:\n#+BEGIN_QUOTE\n%i\n#+END_QUOTE\n[[%:link][%:(transform-square=brackets-to-round-ones \"%:description\")]]\n%?")))))

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


;;(map! :nvi "C-S-h" #'+evil/window-move-left)
;;(map! :nvi "C-S-j" #'+evil/window-move-down)
;;(map! :nvi "C-S-k" #'+evil/window-move-up)
;;(map! :nvi "C-S-l" #'+evil/window-move-right)

(after! 'eglot
  (progn
    (set-eglot-client! 'crystal-mode '("scry"))
    (add-hook 'crystal-mode-hook 'eglot-ensure)
    (set-eglot-client! 'latex-mode '("texlab"))
    (add-hook 'latex-mode-hook 'eglot-ensure)))

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
(after! 'ox-latex
  (add-to-list 'org-latex-classes
             '("report"
                "\\documentclass[article,a4paper]{jlreq}
[NO-PACKAGES]
[NO-DEFAULT-PACKAGES]
\\usepackage{amssymb,amsmath}
\\usepackage{hyperref}
\\usepackage{graphicx,color}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("lualatex-beamer"
                 "\\documentclass[12pt,presentation]{beamer}
[NO-DEFAULT-PACKAGES]
\\usepackage{luatexja}
\\usepackage[sourcehan-jp]{luatexja-preset}
\\usepackage{textcomp}
\\usepackage{graphicx}
% \\usepackage{booktabs}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{hyperref}
\\hypersetup{pdfencoding=auto, linkbordercolor={0 1 0}}
% \\usepackage{beamerthemeshadow}
\\RequirePackage{fancyvrb}"
                 ("\\section{%s}". "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (defvar org-latex-compiler "lualatex")
  (defvar org-latex-default-class "report")
  (defvar org-latex-pdf-process '("cluttex -e lualatex %f"))
  (defvar org-file-apps-gnu '(("pdf" . "llpp %s"))))

