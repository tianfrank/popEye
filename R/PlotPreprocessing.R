
PlotPreprocessing <- function(exp, subject, trial, pdf = NULL, interactive = F, 
                              cex = 1.2) {
  
  # start pdf
  if (missing(pdf) == T) {
    par(mfrow = c(2, 2), cex = cex, oma = c(0, 0, 3, 0))
    if (interactive == T) par(ask = T)
  } else {
    options(warn = -1)
    pdf(pdf, width = 16, height = 8.5)
    par(mfrow = c(2, 2), cex = cex, oma = c(0, 0, 2, 0))
  }
  
  PlotXY(exp, subject, trial, sub = T)
  
  # NOTE: 2D velocity plot does not really make sense for H3 calibration 
  PlotVelocity(exp, subject, trial, sub = T)
  PlotX(exp, subject, trial, sub = T)
  
  # NOTE: y position plot does not make sense for H3 calibration 
  PlotY(exp, subject, trial, sub = T)
  
  # turn of device  
  if (missing(pdf) == T) {
    title(paste("Trial", SelectSubject(exp, subject)$trial[[trial]]$meta$trialid, 
                sep = " "), outer = T, cex.main = 2)
    par(mfrow = c(1, 1), cex = 1, oma = c(0, 0, 0, 0))
    if (interactive == T) par(ask = F)
  } else {
    options(warn = 0)
    title(paste("Trial", SelectSubject(exp, subject)$trial[[trial]]$meta$trialid, 
                sep = " "), outer = T, cex.main = 1.75)
    dev.off()
  }
  
}