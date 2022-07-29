;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (progn (cd "~/.emacs.d")
;; 	   (normal-top-level-add-subdirs-to-load-path))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(autoload 'paredit-mode "paredit"
		  "Minor mode for pseudo-structurally editing Lisp code."
		  t)

(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(require 'dirtree)

;; (require 'unicode-fonts)
;; (unicode-fonts-setup)

(global-font-lock-mode t)
(show-paren-mode 1)
(setq make-backup-files nil)

(add-hook 'scheme-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(eval-after-load 'paredit
		 '(progn
		    (define-key paredit-mode-map (kbd "<C-up>") 'paredit-splice-sexp-killing-backward)
		    (define-key paredit-mode-map (kbd "<C-down>") 'paredit-splice-sexp-killing-forward)
		    ))

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
	  (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
		  (lambda ()
			(abbrev-mode 1)
			(auto-fill-mode 1)
			(if (eq window-system 'x)
			  (font-lock-mode 1))))
;;;;;;;;;;;;
;; Scheme 
;;;;;;;;;;;;

(require 'cmuscheme)
(setq scheme-program-name "mit-scheme")
;(setq scheme-program-name "racket")
;(setq scheme-program-name "petite")
;(setq geiser-active-implementations '(racket))
(setq python-shell-interpreter "python3")

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
; (add-hook 'haskell-mode-hook #'hindent-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("a3e99dbdaa138996bb0c9c806bc3c3c6b4fd61d6973b946d750b555af8b7555b" "70cfdd2e7beaf492d84dfd5f1955ca358afb0a279df6bd03240c2ce74a578e9e" "9040edb21d65cef8a4a4763944304c1a6655e85aabb6e164db6d5ba4fc494a04" "fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "492c17f7ddb159a211ddca595a738ce42c5ac038c8abd480f53863684e23053a" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "f56eb33cd9f1e49c5df0080a3e8a292e83890a61a89bceeaa481a5f183e8e3ef" "d0fa4334234e97ece3d72d86e39a574f8256b4a8699a1fb5390c402892a1c024" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "0f0a4dca8bb029dc5139f447ff25bc3c18d31872c30a46d03c6bbc706ded3586" "7aaee3a00f6eb16836f5b28bdccde9e1079654060d26ce4b8f49b56689c51904" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "0c9f63c9d90d0d135935392873cd016cc1767638de92841a5b277481f1ec1f4a" "cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "e03d2f414fb109f3920752b10b92323697174f49d577da9e69979edbb147a921" "0c32e4f0789f567a560be625f239ee9ec651e524e46a4708eb4aba3b9cdc89c5" "3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" "f36b0a4ecb6151c0ec4d51d5cafc94de326b4659aaa7ac64a663e38ebc6d71dc" "5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "093b2a26030dcd576cad4e59b5d804bc0496e56f4e2659e8900b4814279c3402" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "4fc7f95b03416aa4270cdeefecc45f3153b8ceadef2e8d5722dce63d1bf83400" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "3d47d88c86c30150c9a993cc14c808c769dad2d4e9d0388a24fee1fbf61f0971" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "c4465c56ee0cac519dd6ab6249c7fd5bb2c7f7f78ba2875d28a50d3c20a59473" "e15e15c389b9a2f813bb3b8034f0777bbfb1f80b2349c5c98a84b9d807275fac" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "316d29f8cd6ca980bf2e3f1c44d3a64c1a20ac5f825a167f76e5c619b4e92ff4" "99953b61ecd4c3e414a177934e888ce9ee12782bbaf2125ec2385d5fd732cbc2" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "708df3cbb25425ccbf077a6e6f014dc3588faba968c90b74097d11177b711ad1" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" default))
 '(doc-view-continuous t)
 '(fci-rule-color "#383838")
 '(haskell-indent-spaces 4)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'auto)
 '(haskell-stylish-on-save t)
 '(liquid-types/trigger 'double-mouse-1)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(lsp-mode fstar-mode yaml z3-mode helm-idris idris-mode vterm company-lean helm-lean lean-mode proof-general flycheck-liquidhs liquid-types hindent unicode-fonts company-coq cargo flycheck-rust rust-mode rustfmt company-anaconda anaconda-mode utop flycheck-ocaml tuareg helm zenburn-theme undo-tree ujelly-theme sml-mode scala-mode2 sbt-mode racket-mode pos-tip popup paredit nyan-mode markdown-mode magic-latex-buffer flycheck-stack flycheck-haskell flycheck-color-mode-line exec-path-from-shell dirtree csv-mode company color-theme-sanityinc-tomorrow button-lock))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((eval let
           ((default-directory
              (locate-dominating-file buffer-file-name ".dir-locals.el")))
           (make-local-variable 'coq-prog-name)
           (setq coq-prog-name
                 (expand-file-name "../hoqtop")))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))

(add-to-list 'haskell-process-args-stack-ghci "--test")
(add-to-list 'haskell-process-args-stack-ghci "--bench")

(autoload 'utop "utop" "Toplevel for OCaml" t)
(setq utop-command "opam config exec -- utop -emacs")
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(setq tab-width 4)
(setq standard-indent 4)
(electric-indent-mode 1)
(setq line-number-mode t)
(setq column-number-mode t)
(blink-cursor-mode 0)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; -- common-lisp compatibility if not added earlier in your .emacs
(require 'cl-lib)

(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;;(set-frame-font "PragmataPro 16" nil t)
;;(set-frame-font "Menlo 16" nil t)
;;(set-frame-font "Monaco 16" nil t)
(set-frame-font "DejaVu Sans Mono for Powerline-14" nil t)
;; (set-frame-font "Source Code Pro for Powerline 14" nil t)
;; (set-frame-font "Hack 14" nil t)
;; (set-frame-font "JetBrains Mono-14" nil t)

(add-hook 'after-init-hook 'global-company-mode)
(setq make-backup-files nil)

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))
(add-hook 'agda-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'nyan-mode)
(nyan-mode)

(require 'agda-input)

(require 'magic-latex-buffer)

(add-hook 'latex-mode-hook 'magic-latex-buffer)

(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)


;; ----------------------- Configure Flycheck ------------------

(require 'flycheck)

;; Global Flycheck
(global-flycheck-mode)

;; Rerun check on idle and save
(setq flycheck-check-syntax-automatically
      '(mode-enabled idle-change save))

;; ----------------------- Configure LiquidHaskell -------------

;; (require 'liquid-types)

;; ;; Toggle minor mode on entering Haskell mode.
;; (add-hook 'haskell-mode-hook
;; 	  '(lambda () (liquid-types-mode)))
;; (add-hook 'literate-haskell-mode-hook
;; 	  '(lambda () (liquid-types-mode)))

;; (require 'flycheck-liquidhs)
;; (require 'flycheck-stack)

;; (add-hook 'haskell-mode-hook
;; 	  '(lambda () (flycheck-select-checker 'haskell-stack-ghc)))

;; (add-hook 'literate-haskell-mode-hook
;; 	  '(lambda () (flycheck-select-checker 'haskell-stack-ghc)))

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(set-face-attribute 'flycheck-error nil
                    :foreground "red"
		    :background "yellow")

;; (add-to-list 'flycheck-checkers 'haskell-liquid)

;; (add-hook 'liquid-types-mode-hook
;; 	  '(lambda () (flycheck-select-checker 'haskell-liquid)))

;; (add-hook 'flycheck-mode-hook
;; 	  (lambda ()
;; 	    (flycheck-add-next-checker 'haskell-stack-ghc 'haskell-liquid)))

(require 'helm-config)
(helm-mode 1)
;; (defun nm-around-helm-buffers-sort-transformer (candidates source)
;;   candidates)

(advice-add 'helm-buffers-sort-transformer
            :override #'nm-around-helm-buffers-sort-transformer)

(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
;; (add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
;; (add-hook 'rust-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (add-hook 'racer-mode-hook #'company-mode)

(add-hook 'coq-mode-hook #'company-coq-mode)
;; (setq coq-prog-name "/Users/chchen/HoTT-Coq/hoqtop")

(setq ispell-dictionary "en_US")
(add-hook 'latex-mode-hook #'turn-on-flyspell)
(add-hook 'markdown-mode-hook #'turn-on-flyspell)
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)))

(custom-theme-set-faces
 'zenburn
 '(flyspell-duplicate ((t (:weight bold :foreground "OrangeRed" :underline (:color "#ff0000" :style wave)))))
 '(flyspell-incorrect ((t (:weight bold :foreground "Red" :underline (:color "#ff0000" :style wave)))))
 ;; '(agda2-highlight-coverage-problem-face ((t (:background "orange4"))))
 ;; '(agda2-highlight-postulate-face ((t (:foreground "LightSteelBlue1"))))
 ;; '(agda2-highlight-primitive-face ((t (:foreground "LightSteelBlue1"))))
 ;; '(agda2-highlight-record-face ((t (:foreground "#268bd2"))))
 ;; '(agda2-highlight-catchall-clause-face ((t (:foreground "gray100"))))
 ;; '(agda2-highlight-unsolved-meta-face ((t (:background "dark red"))))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default flycheck-disabled-checkers '(coq haskell agda2))

(global-set-key (kbd "S-SPC") #'company-complete)

;; (setq command-line-default-directory "~/")

;; (add-to-list 'load-path "~/.emacs.d/lisp/idris2-mode/")
;; (require 'idris2-mode)

(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "gnu++2a")))
