% Xpose 4
% An R-based population pharmacokinetic/
% pharmacodynamic model building aid for NONMEM.
% Copyright (C) 1998-2004 E. Niclas Jonsson and Mats Karlsson.
% Copyright (C) 2005-2008 Andrew C. Hooker, Justin J. Wilkins, 
% Mats O. Karlsson and E. Niclas Jonsson.
% Copyright (C) 2009-2010 Andrew C. Hooker, Mats O. Karlsson and 
% E. Niclas Jonsson.

% This file is a part of Xpose 4.
% Xpose 4 is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public License
% as published by the Free Software Foundation, either version 3
% of the License, or (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.

% You should have received a copy of the GNU Lesser General Public License
% along with this program.  A copy can be cound in the R installation
% directory under \share\licenses. If not, see http://www.gnu.org/licenses/.

\name{xpose.plot.qq}
\alias{xpose.plot.qq}
\title{The generic Xpose functions for QQ plots}
\description{
  This is a wrapper function for the lattice \code{\link[lattice]{qqmath}} function.
}
\usage{
xpose.plot.qq(x, object,
           inclZeroWRES = FALSE,
           onlyfirst    = FALSE,
           samp         = NULL, 
           aspect       = object@Prefs@Graph.prefs$aspect,
           scales       = list(),
           by=object@Prefs@Graph.prefs$condvar,
           force.by.factor = FALSE,
           ordby     = object@Prefs@Graph.prefs$ordby,
           byordfun  = object@Prefs@Graph.prefs$byordfun,
           shingnum  = object@Prefs@Graph.prefs$shingnum,
           shingol   = object@Prefs@Graph.prefs$shingol,
           strip = function(...)
           strip.default(...,strip.names=c(TRUE,TRUE)),
           subset       = xsubset(object),
           main  = xpose.create.title.hist(x,object,subset,...),
           xlb          = "Quantiles of Normal",
           ylb          = paste("Quantiles of ",xlabel(x,object),sep=""),
           pch=object@Prefs@Graph.prefs$pch,
           col=object@Prefs@Graph.prefs$col,
           cex=object@Prefs@Graph.prefs$cex,
           abllty = object@Prefs@Graph.prefs$abllty,
           abllwd = object@Prefs@Graph.prefs$abllwd,
           ablcol = object@Prefs@Graph.prefs$ablcol,
           mirror       = FALSE,
           max.plots.per.page=4,
           mirror.aspect="fill",
           pass.plot.list=FALSE,
           x.cex=NULL,
           y.cex=NULL,
           main.cex=NULL,
           mirror.internal=list(strip.missing=missing(strip)),
           ...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A string or a vector of strings with the name(s) of the x-variable(s).}
  \item{object}{An "xpose.data" object.}
  \item{inclZeroWRES}{A logical value indicating whether rows with WRES=0
  should be plotted.}
  \item{onlyfirst}{A logical value indicating whether only the first row
    per individual should be included in the plot. }
  \item{samp}{An integer between 1 and object@Nsim
    (see\code{\link{xpose.data-class}}) specifying which of the
    simulated data sets to extract from SData.}
  \item{aspect}{The aspect ratio of the display (see \code{\link[lattice]{qqmath}}).}
  \item{scales}{A list to be used for the \code{scales} argument in \code{\link[lattice]{qqmath}}.}
  \item{by}{A string or a vector of strings with the name(s) of the
    conditioning variables.}
  \item{force.by.factor}{Logical value. If TRUE, and \code{by} is not \code{NULL},
    the variable specified by \code{by} is taken as categorical.}
  \item{ordby}{A string with the name of a variable to be used to
    reorder any factor conditioning variables (\code{by}). The variable
    is used in a call to the \code{reorder} function. }
  \item{byordfun}{The name of the function to be used when reordering a
    factor conditioning variable (see argument \code{ordby}).}
  \item{shingnum}{The number of shingles ("parts") a continuous
    conditioning variable should be divided into.}
  \item{shingol}{The amount of overlap between adjacent shingles (see
    argument \code{shingnum}).}
  \item{strip}{The name of the function to be used as the strip argument
  to the \code{\link[lattice]{xyplot}}.}
  %\item{par.strip.text}{A list of graphical parameters used to control
  %  the apparence of the text in the strips. See \code{\link[lattice]{strip.default}}.}
  \item{subset}{A string giving the subset expression to be applied to
    the data before plotting. See \code{\link{xsubset}}.}
  \item{main}{A string giving the plot title or \code{NULL} if none.}
  \item{xlb}{A string giving the label for the x-axis. \code{NULL} if none.}
  \item{ylb}{A string giving the label for the y-axis. \code{NULL} if none.}
  \item{pch}{Plotting symbol.}
  \item{col}{Color of plotting symbol.}
  \item{cex}{Amount to scale the plotting character by.}
  \item{abllty}{Line type for qqline.}
  \item{abllwd}{Line width for qqline.}
  \item{ablcol}{Color for qqline.}
  \item{mirror}{Should we create mirror plots from simulation data?
    Value can be \code{FALSE}, \code{TRUE} or \code{1} for one mirror
    plot, or \code{3} for three mirror plots.}
  \item{max.plots.per.page}{The maximum number of plots per page that
    can be created with the mirror plots.}
  \item{mirror.aspect}{The aspect ratio of the plots used for mirror
    functionality.}
  \item{pass.plot.list}{Should we pass the list of plots created with
    mirror or should we print them directly.  Values can be
    \code{TRUE/FALSE}.}
  \item{x.cex}{The size of the x-axis label.}
  \item{y.cex}{The size of the y-axis label.}
  \item{main.cex}{The size of the title.}
  \item{mirror.internal}{an internal mirror argument used in
    \code{\link{create.mirror}}.  Checks if the
    \code{strip} argument from \code{\link[lattice]{qqmath}} has been used.}
  \item{\dots}{Other arguments passed to
    \code{\link{xpose.plot.qq}}.}
  
}
\author{E. Niclas Jonsson, Mats Karlsson, Andrew Hooker & Justin Wilkins}
\seealso{
\code{\link{xpose.panel.qq}},
\code{\link[lattice]{qqmath}},
\code{\link[lattice]{panel.qqmathline}}, 
\code{\link{xpose.data-class}}
}
\examples{
\dontrun{
## xpdb5 is an Xpose data object
## We expect to find the required NONMEM run and table files for run
## 5 in the current working directory
xpdb5 <- xpose.data(5)

## A QQ plot of WRES
xpose.plot.qq("WRES", xpdb5) 
}

}
\keyword{methods}
