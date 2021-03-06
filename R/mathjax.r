examples.mathjaxlocal = function() {
  library(MathjaxLocal)
  library(shinyEvents)
  app = eventsApp()
  app$ui = fluidPage(
    with_mathjax(p("\\(x^2\\)"))
  )
  viewApp(app)
}
mathjaxLocalHeader = function() {

  #dir = system.file("/www/MathJax-2.7.1",package="MathjaxLocal")
  #shiny::addResourcePath("RMathjaxLocal",dir)
  #path <- "RMathjaxLocal/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
  #tags$head(singleton(tags$script(src = path, type = "text/javascript")))


  dep =htmlDependency("RMathjaxLocal",version="2.7.1", src="/www/MathJax-2.7.1", head ='<script src="RMathjaxLocal-2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>',package="MathjaxLocal")
  #res=resolveDependencies(dependencies=list(dep), TRUE)
  dep
}


withMathJax = with_mathjax = function(...) {
  header = mathjaxLocalHeader()
  tagList(header,
        ..., tags$script(HTML("if (window.MathJax) MathJax.Hub.Queue([\"Typeset\", MathJax.Hub]);")))

}
