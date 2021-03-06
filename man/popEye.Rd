% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/popEye.R
\name{popEye}
\alias{popEye}
\title{Main popEye encoding function}
\usage{
popEye(
  datpath,
  stimulus.file,
  tracker.model = "eyelink",
  tracker.software = "EB",
  tracker.results = FALSE,
  type = "sentence",
  message.start = "SYNCTIME",
  message.stop = "stop",
  message.boundary = "boundary",
  message.target = "target",
  message.prime = "prime",
  variable.id = "id",
  variable.cond = NA,
  item.practice = "^P",
  item.trigger = "999",
  item.question = 1000,
  item.pracnum = 0,
  stimulus.id = "id",
  stimulus.cond = NA,
  stimulus.preview = "preview",
  stimulus.prime = "prime",
  stimulus.text = "text",
  indicator.word = " ",
  indicator.ia = " ",
  indicator.target = "\\\\*",
  indicator.line = "\\\\\\\\n",
  display.marginLeft = 150,
  display.marginTop = 300,
  display.marginRight = 50,
  display.marginBottom = 100,
  font.name = "CourierNew",
  font.size = 16,
  font.spacing = 2,
  analysis.eyelink = TRUE,
  analysis.vfac = 5,
  analysis.mindur = 10,
  analysis.postdur = 30,
  analysis.drift = TRUE,
  analysis.sparse = TRUE,
  analysis.driftX = FALSE,
  analysis.driftY = FALSE,
  analysis.translate = FALSE,
  analysis.lineMethod = "chain",
  analysis.outlierX = 100,
  analysis.outlierY = 100,
  analysis.lineX = 20,
  analysis.lineY = 0.5,
  clean.stage1Dur = 80,
  clean.stage1Dist = 1,
  clean.stage2Dur = 40,
  clean.stage2Dist = 3,
  clean.stage3 = FALSE,
  clean.stage3Dur = 140,
  clean.stage4 = FALSE,
  clean.stage4Min = 80,
  clean.stage4Max = 800,
  clean.delete = FALSE,
  clean.outlier = FALSE,
  exclude.nfix = 3,
  exclude.sac = 150,
  outpath = getwd(),
  outname = "",
  select.version = NULL,
  select.subject = NULL,
  select.trial = NULL,
  debug = "none"
)
}
\arguments{
\item{datpath}{Path to eye tracking files}

\item{stimulus.file}{Path and name of stimulus file}

\item{tracker.model}{Eye tracker used for data collection (only "eyelink"
available at present)}

\item{tracker.software}{Software used for data collection ("EB" for 
"Experiment Builder" or "ET" for "EyeTrack")}

\item{tracker.results}{Whether a results file is generated by the eye tracking
software (TRUE or FALSE)}

\item{type}{Type of experiment used in the study ("sentence", "target", 
"boundary", "fast")}

\item{message.start}{Message in eye tracking file indicating the start of
the trial}

\item{message.stop}{Message in eye tracking file indicating the end of the trial}

\item{message.boundary}{Message in eye tracking file indicating when the boundary
is triggered (only relevant for boundary and fast priming experiments)}

\item{message.target}{Message in eye tracking file indicating the onset of
the target display (only relevant for boundary experiments)}

\item{message.prime}{Message in eye tracking file indicating the onset of the
prime display (only relevant for fast priming experiments)}

\item{variable.id}{Variable in eye tracking experiment indicating which item 
is displayed in a trial ("id" by default)}

\item{variable.cond}{Variable in eye tracking experiment indicating in which
(within-item) condition the item is displayed in a trial (if any; no
conditions by default)}

\item{item.practice}{Indicator for a practice item that is displayed at the 
beginning of an experiment (only relevant for EyeTrack experiments)}

\item{item.trigger}{Indicator for an gaze trigger element used in the 
experiment (only relevant for EyeTrack experiments)}

\item{item.question}{Indicator for a comprehension question trial used
during the experiment (only relevant for EyeTrack experiments)}

\item{item.pracnum}{Number of practice items shown at the beginning of an
experiment (which are discarded during the analysis)}

\item{stimulus.id}{Name of the column providing the item number 
in stimulus file}

\item{stimulus.cond}{Name of the column providing the condition name in the
stimulus file}

\item{stimulus.preview}{Name of the column providing the preview display
in the stimulus file (only relevant for boundary and fast priming exeriments)}

\item{stimulus.prime}{Name of the column providing the prime display in the 
stimulus file (only relevant for fast priming experiments)}

\item{stimulus.text}{Name of the column providing the target (or only) display
in the stimulus file}

\item{indicator.word}{Indicator used to separate words from each other
(blank by default)}

\item{indicator.ia}{Indicator used to separate interest areas from each other
("§" by default)}

\item{indicator.target}{Indicator used to denote the target interest area 
("*" by default)}

\item{indicator.line}{Indicator used for manual line breaks ("\\n" by default)}

\item{display.marginLeft}{Size of the margin at the left of the screen
(in pixels)}

\item{display.marginTop}{Size of the margin at the top of the screen (in pixels)}

\item{display.marginRight}{Size of the margin at the right of the screen 
(in pixels)}

\item{display.marginBottom}{Size of the margin at the bottom of the screen
(in pixels)}

\item{font.name}{Name of the font used in the experiment (currently, "CourierNew",
"Consolas", and "Symbol" are supported)}

\item{font.size}{Size of the font (in pixels)}

\item{font.spacing}{Spacing between lines (1, 1.5, or 2)}

\item{analysis.eyelink}{Should the real-time parsing from the eyelink system 
be used? (TRUE or FALSE, default is TRUE)}

\item{analysis.vfac}{Velocity threshold used for saccade detection (see Engbert & Kliegl, 
2003; default is 5)}

\item{analysis.mindur}{Minimum duration of a saccade (see Engbert & Kliegl, 2003; 
default is 10 ms)}

\item{analysis.postdur}{Minimum duration of a fixation (see Engbert & Kliegl, 
2003; default is 30 ms)}

\item{analysis.drift}{Treat fixations with drift in x or y dimension as blinks
(TRUE or FALSE; default is TRUE. See Engbert & Kliegl, 2003)}

\item{analysis.sparse}{If TRUE, the msg, sample, and event slots are cleaned
during the analysis (TRUE or FALSE, default is TRUE)}

\item{analysis.driftX}{If TRUE fixation is corrected for drift on the x
axis (TRUE or FALSE, default is FALSE; only relevant for EB experiments in
which the drift correct element is used)}

\item{analysis.driftY}{If TRUE fixation is corrected for drift on the y
axis (TRUE or FALSE, default is FALSE; only relevant for EB experiments in
which the drift correct element is used)}

\item{analysis.translate}{If TRUE fixations are moved to fit into text area
(TRUE or FALSE, default is FALSE)}

\item{analysis.lineMethod}{Method used to assign fixations to lines ("match",
"cluster" or "chain", "chain" is default; see Vignette)}

\item{analysis.outlierX}{Parameter for outlier detection on the x axis 
(number of line heights a fixation is allowed to deviate from last letter 
on a line; default is 2)}

\item{analysis.outlierY}{Parameter for outlier detection on the y axis
(number of line heights a fixation is allowed to deviate from the first or
last line on a screen, default is 2)}

\item{analysis.lineX}{Parameter used to detect runs on the x axsis 
if "chain" method is used (default is 20)}

\item{analysis.lineY}{Parameter used to detect runs on the y axsis 
if "chain" method is used (default is 2)}

\item{clean.stage1Dur}{Minimum duration for fixation during stage 1 
cleaning (default: 80 ms)}

\item{clean.stage1Dist}{Minimum distance between fixations (in number
of letters) during stage 1 cleaning (default: 1)}

\item{clean.stage2Dur}{Minimum duration of fixation during stage 2
cleaning (default: 40 ms)}

\item{clean.stage2Dist}{Minimum distance between fixations (in number
of letters) during stage 2 cleaning}

\item{clean.stage3}{If TRUE, stage 3 cleaning is conducted (default is FALSE)}

\item{clean.stage3Dur}{Minimum duration of fixation during stage 3 cleaning 
(default is 140 ms)}

\item{clean.stage4}{If TRUE stage 4 cleaning is conducted (default is FALSE)}

\item{clean.stage4Min}{Minimum duration of fixation during stage 4 cleaning
(default is 80 ms)}

\item{clean.stage4Max}{Maximum duration of fixation during stage 4 cleaning
(default is 800 ms)}

\item{clean.outlier}{If TRUE outlying fixations at the begining and the end
of a trial are deleted (default is FALSE)}

\item{exclude.nfix}{Minimum number of fixations that a trial has to have 
received (deleted otherwise; default is 3)}

\item{exclude.sac}{Duration for screen for unplausibel long saccades (in ms;
200 ms as default).}

\item{outpath}{Path were output file should be saved}

\item{outname}{Name of output file}

\item{select.version}{Restrict analysis to a specific version of the experiment
(numeric; internal for debugging; only relevant for EB experiments)}

\item{select.subject}{Restrict analysis to a specific subject (within a version)
(numeric; internal for debugging). Select a single subject by specifying a single
number (e.g., select.subject = 4). Select a range of subjects by using the colon 
operator (e.g., select.subject = 1:4).}

\item{select.trial}{Restrict analysis to a specific trial (numeric; internal for debugging)}

\item{debug}{Perform analysis only for specific steps of the analysis ("setup", 
"read", "remove", "create")}

\item{exclude.blink}{If TRUE a trial is flagged as critical if at least one
blink has occured on it (default is FALSE)}
}
\description{
This function is used when you want to analyze eye tracking data using popEye.
}
