(TeX-add-style-hook
 "essay_1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "letterpaper")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "geometry"
    "times"
    "setspace"
    "rotating"
    "fancyhdr")
   (TeX-add-symbols
    "bibent")
   (LaTeX-add-environments
    "workscited"))
 :latex)

