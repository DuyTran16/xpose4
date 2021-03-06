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
\name{gof}
\alias{gof}
\alias{gofSetup}
\alias{xpPage}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Structured goodness of fit diagnostics.
}
\description{
This is a template function for creating structured goodness of fit
diagnostics using the functions in the Xpose specific library.
}
\usage{
gof(runno=NULL,save=FALSE,onefile=FALSE,
    saveType="pdf",pageWidth=7.6,pageHeight=4.9,
    structural = TRUE,residual=TRUE,covariate=FALSE,
    iiv=FALSE,iov=FALSE,all=FALSE,myTrace=xpPage)
}
\arguments{
  \item{runno}{
  The run number fo Xpose to identify the appropriate files to read. In addition \code{runno} 
  is used to construct the file name to save plots in. \code{runno} can also be \code{NULL} for
  cases in which the function is used for non-Xpose based code.
}
  \item{save}{
  Logical. \code{TRUE} if the plot(s) is to be saved in a file. \code{FALSE} if the plot(s) 
  is to be displayed on screen. The plot(s) will be saved in a file named with the function 
  name followed by the word 'run', the run number, an order number followed by a file name 
  extension appropriate for the selected \code{saveType}. For example 'gofrun1-01.pdf' for the 
  first plot file created by a script called \code{gof} based on output from run 1 and 
  \code{saveType='pdf'}.
}
  \item{onefile}{
  Logical. \code{TRUE} if plots are to be save in a single file and \code{FALSE} if each plot 
  should be saved as a separate file. In the latter case, each file will be have an 
  incremented order number (01-99).
}
  \item{saveType}{
  The type of graphics file to produce if \code{save=TRUE}. Allowed values are 'pdf' 
  (default), 'wmf' (only Windows) and 'png'.

}
  \item{pageWidth}{
  The width of the graphics device in inches. 
}
  \item{pageHeight}{
  The height of the graphics device in inches.	
}
  \item{structural}{
  Logical. \code{TRUE} if the code in the structural model section (see below) should be 
  executed and \code{FALSE} if not.
}
  \item{residual}{
  Logical. \code{TRUE} if the code in the residual model section (see below) should be 
  executed and \code{FALSE} if not.
}
  \item{covariate}{
  Logical. \code{TRUE} if the code in the covariate model section (see below) should be 
  executed and \code{FALSE} if not.
}
  \item{iiv}{
  Logical. \code{TRUE} if the code in the IIV model section (see below) should be 
  executed and \code{FALSE} if not.
}
  \item{iov}{
  Logical. \code{TRUE} if the code in the IOV model section (see below) should be 
  executed and \code{FALSE} if not.
}
  \item{all}{
  Logical. \code{TRUE} if the code in all sections (see below) should be 
  executed.
}
  \item{myTrace}{
  \code{NULL} or the name of a function. The value of \code{myTrace} can used with 
  the lattice \code{page=} argument to annotate plots for tracability.
}
}
\details{
The \code{gof} function is provided as a template to facilitate the (structured) use of 
the functions in the Xpose specific library. Xpose specific is extensively descibed in the 
'Xpose Bestiary'.

The function can be renamed so that multiple scripts can be used in paralell. 

The function is set up to make it easy to display plots on screen as well as to save them 
in files. In the latter case, plots are save in a sub-directory called 'Plots'.

The arguments \code{structural}, \code{residual}, \code{covariate},
\code{iiv}, \code{iov} and \code{all} are just "switches" to different
parts of the code (if-blocks). These blocks can be removed or the
default values of the arguments changed to better suit the needs of the user.

It is also possible to add tracing information to the produced
plots. This is done via the \code{myTrace} argument. A non-NULL value
should be a function that returns a \code{panel.text} object. The
default is the \code{xpPage} function that will put a string
concatenated from the device name, function name, working directory
and date, in small, faint grey, font at the bottom of each graph
page. Note that the user need to add \code{page=myTrace} as an
argument to the Xpose functions for this to have an effect.


The function calls a support function called \code{gofSetup}, which is
responsible for setting up the graphics device and determining the
file names for saved graphs.

}
\value{
Does not return anything unless the user specify a return value.
}

\author{
E. Niclas Jonsson, Mats Karlsson and Andrew Hooker
}

\seealso{
\code{\link[xpose4]{xpose4-package}}
}
\examples{
\dontrun{
## This is an example of how the function may be setup by a user.

library(xpose4)
mygof <- gof
fix(mygof)

myggof <- function (runno = NULL, save = FALSE, onefile = FALSE, saveType = "pdf", 
         pageWidth = 7.6, pageHeight = 4.9, structural = TRUE, residual = TRUE, 
         covariate = FALSE, iiv = FALSE, iov = FALSE, all = FALSE, myTrace=xpPage) {

         gofSetup(runno, save, onefile, saveType, pageWidth, pageHeight)
         xpdb <- xpose.data(runno)

         if (structural || all) {
          xplot <- dv.vs.pred.ipred(xpdb, page = myPage)
          print(xplot)
         }
         if (residual || all) {
          xplot <- absval.wres.vs.pred(xpdb, page = myPage)
          print(xplot)
         }
         if (covariate || all) {
         }
         if (iiv || all) {
         }
         if (iov || all) {
         }
         if (save) dev.off()
    invisible()
  }

## The function can then be execute, e.g.:
mygof(1)

}
}
\keyword{methods}
