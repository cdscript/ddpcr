% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plate.R
\name{new_plate}
\alias{new_plate}
\title{Create a new ddPCR plate}
\usage{
new_plate(dir, type, data_files, meta_file, name, params)
}
\arguments{
\item{dir}{The directory containing the ddPCR droplet data files, and potentially
the plate results file}

\item{type}{A ddPCR plate type (see \code{\link[ddpcr]{plate_types}})}

\item{data_files}{If \code{dir} is not provided, you can provide a vector of
file paths to the ddPCR droplet data files.}

\item{meta_file}{If \code{dir} is not provided, you can provide a file path
to the ddPCR results file.}

\item{name}{Name of the dataset. If not provided, the name will be guessed
based on the filenames.}

\item{params}{List of parameters to set for the plate. Only advanced users
should consider using this feature.}
}
\value{
A new ddPCR plate object with droplet data loaded that is ready
to be analyzed.
}
\description{
Any ddPCR analysis must start by creating a ddPCR plate object. Use this
function to read ddPCR data into R and create a plate object that can then
be analyzed.
}
\details{
\href{https://github.com/daattali/ddpcr#advanced-topic-3-creating-new-plate-types}{See the README} for more
information on plate types.
}
\section{Providing ddPCR data}{

The first step to using the \code{ddpcr} package is to get the ddPCR data into
R. This package uses as input the data files that are exported by QuantaSoft.
For a dataset with 20 wells, QuantaSoft will create 20 well files (each ending
with "_Amplitude.csv") and one results file. The well files are essential for
analysis since they contain the actual droplet data, and the results file
is optional because the only information used from it is the mapping from
well IDs to sample names.

The easiest way to use your ddPCR data with this package is to Export the data
from QuantaSoft into some directory, and providing that directory as the 
\code{dir} argument.  This way, this package will automatically find all the
data files as well as the results file.  Alternatively, you can provide the
data files (well files) manually as a list of filenames using the \code{data_files}
argument. If you use the \code{data_files} argument instead of \code{dir}, you
can also optionally provide the results file as the \code{meta_file} argument.
If no results file is provided then the wells will not be mapped to their sample
names.
}

\section{Plate parameters}{

Every plate has a set of default parameters that are used in the analysis.
You can see all the parameters of a plate with the \code{\link[ddpcr]{params}}
function. If you want to provide different values for some parameters when
initializing a plate, you can do that with the \code{params} argument. This
is considered an advanced feature.

For example, if you inspect the parameters of any ddPCR plate, you will see that
by defalt the random seed used by default is 8. If you want to create
a new plate that uses a different random seed, you could do so like this:
\preformatted{
plate <- new_plate(sample_data_dir(), params = list('GENERAL' = list('RANDOM_SEED' = 10)))
plate %>% p
} 

Most numeric parameters that are used in the algorithms of the analysis steps
can be modified in a similar fashion. This can be used to fine-tune the 
analysis of a plate if you require different parameters.
}

\examples{
\dontrun{
plate <- new_plate(sample_data_dir())
} 
}
\seealso{
\code{\link[ddpcr]{plate_types}}\cr
\code{\link[ddpcr]{type}}\cr
\code{\link[ddpcr]{reset}}\cr
\code{\link[ddpcr]{analyze}}\cr
\code{\link[ddpcr]{plot.ddpcr_plate}}\cr
\code{\link[ddpcr]{params}}
}
