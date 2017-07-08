mathjaxLocalHeader = function() {

  dir = system.file("www/MathJax-2.7.1",package="MathjaxLocal")
  shiny::addResourcePath("RMathjaxLocal",dir)

  path <- "RMathjaxLocal/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
  tags$head(singleton(tags$script(src = path, type = "text/javascript")))
}


withMathJax = with_mathjax = function(...) {
  header = mathjaxLocalHeader()
  tagList(header,
        ..., tags$script(HTML("if (window.MathJax) MathJax.Hub.Queue([\"Typeset\", MathJax.Hub]);")))

}
