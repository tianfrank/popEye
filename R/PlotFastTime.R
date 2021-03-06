
PlotFastTime <- function(exp, subject, trial, pdf = F, interactive = F, sub = F) {
  
  # start pdf
  if (sub == F) {
    if (pdf == T) {
      pdf("Test.pdf", width = 16, height = 8.5)
      par(mfrow = c(1, 1), cex = .9, oma = c(0, 0, 2, 0))
    } else {
      par(mfrow = c(1, 1), cex = 1.25, oma = c(0, 0, 3, 0))
      if (interactive == T) par(ask = T)
    }
  }
  
  tmp <- SelectSubjectTrial(exp, subject, trial)
  

  # compute boundary time and location
  boundary.time <- tmp$all$start[tmp$all$msg == exp$setup$message$boundary]
  prime.time <- tmp$all$start[tmp$all$msg == exp$setup$message$prime]
  target.time <- tmp$all$start[tmp$all$msg == exp$setup$message$target]
  boundary.loc <- as.numeric(tmp$meta$boundary)
  
  # compute offsets
  offset.time.left <- 50
  offset.time.right <- 100
  offset.loc <- 130
  
  # TODO: change this
  
  # create plot
  if (sub == T) {
    plot(tmp$xy$time[(boundary.time - offset.time.left):(boundary.time + offset.time.right)],
         tmp$xy$x[(boundary.time - offset.time.left):(boundary.time + offset.time.right)], 
         type = "l", ylim = c(boundary.loc + offset.loc, boundary.loc - offset.loc), 
         main = "Time Plot", xlab = "Time (ms)", ylab = "x Position (px)")
  } else {
    plot(tmp$xy$time[(boundary.time - offset.time.left):(boundary.time + offset.time.right)],
         tmp$xy$x[(boundary.time - offset.time.left):(boundary.time + offset.time.right)], 
         type = "l", ylim = c(boundary.loc + offset.loc, boundary.loc - offset.loc),  
         main = paste("Trial", trial, sep = " "), 
         xlab = "Time (ms)", ylab = "x Position (px)", xaxt = "none")
    axis(1, at = seq((boundary.time - offset.time.left), (boundary.time + offset.time.right), by = 10), 
         tick = T)
  }

  # compute fixations
  fix <- tmp$fix
  fix.before <- tail(fix$stop[fix$start < boundary.time], n = 1)
  fix.after <- head(fix$start[fix$start > boundary.time], n = 1)
  
  for (i in 1:nrow(fix)){
    lines(fix$start[i]:fix$stop[i],
          rep(fix$xs[i], fix$stop[i] - fix$start[i] + 1),
          col = "cornflowerblue", lwd = 3)
  }
  
  abline(v = fix.before, lty = 1, col = "cornflowerblue", lwd = 2)
  abline(v = fix.after, lty = 1, col = "cornflowerblue", lwd = 2)
  
  # change saccade
  rect(fix.before, 0, fix.after, exp$setup$display$resolutionX,
       angle = NA, lwd = 2, col = makeTransparent("lightblue", alpha = .2))
  
  i# add text
  letters <- unlist(strsplit(tmp$meta$text, ""))
  x <- exp$setup$display$marginX
  y <- exp$setup$display$marginY
  
  # add lines
  for (i in 1:length(tmp$meta$letter.boundary)) {
    abline(h = tmp$meta$letter.boundary[i], cex = .5)
  }

  # add boundary
  abline(h = boundary.loc, col = "navyblue", lwd = 2)
  
  # boundary
  rect(boundary.time, 0, prime.time, exp$setup$display$resolutionX,
       angle = NA, lwd = 2, col = makeTransparent("cornflowerblue", alpha = .2))
  
  # target
  rect(prime.time, 0, target.time, exp$setup$display$resolutionX,
       angle = NA, lwd = 2, col = makeTransparent("navyblue", alpha = .2))
  
  
  # turn off device  
  # ----------------
  
  if (sub == F) {
    if (pdf == T) {
      title(paste("Trial", SelectSubjectTrial(exp, subject, trial)$meta$trialnum, 
                  sep = " "), outer = T, cex.main = 1.75)
      dev.off()
    } else {
      title(paste("Trial", SelectSubjectTrial(exp, subject, trial)$meta$trialnum, 
                  sep = " "), outer = T, cex.main = 2)
      par(mfrow = c(1, 1), cex = 1, oma = c(0, 0, 0, 0))
      if (interactive == T) par(ask = F)
    }  
  }
}
