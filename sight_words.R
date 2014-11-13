sight_words = function(set=7, random=TRUE, file="~/Desktop/sight_words.csv") {
  words = read.csv(file, stringsAsFactors=FALSE)
  
  words = words[words$Set %in% set,]
  
  if (random) {
    words = sample(words$Word)
    start_time = proc.time()
    opar = par(mar=rep(0,4))
    for (i in 1:length(words)) {
      plot(0,0, xlim=c(0,1), ylim=c(0,1), axes=F, xlab='', ylab='', type='n')
      text(0,0.5, words[i], pos=4, cex=9)
      readline("Hit <enter> for next word:")
    }
    par(opar)
    print(proc.time()-start_time)
  } else {
    return(NULL)
  }
}