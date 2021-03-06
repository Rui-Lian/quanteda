% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textplot_network.R
\name{textplot_network}
\alias{textplot_network}
\alias{as.network.fcm}
\title{Plot a network of feature co-occurrences}
\usage{
textplot_network(x, min_freq = 0.5, omit_isolated = TRUE,
  edge_color = "skyblue", edge_alpha = 0.5, edge_size = 2,
  vertex_color = "gray40", vertex_size = 2, vertex_labelcolor = NULL,
  offset = NULL, vertex_labelfont = NULL, ...)

\method{as.network}{fcm}(x, min_freq = 0.5, omit_isolated = TRUE, ...)
}
\arguments{
\item{x}{a \link{fcm} or \link{dfm}  object}

\item{min_freq}{a frequency count threshold or proportion for co-occurrence
frequencies of features to be plotted.}

\item{omit_isolated}{if \code{TRUE}, features do not occur more frequent than
\code{min_freq} will be omitted from the plot}

\item{edge_color}{color of edges that connect vertices.}

\item{edge_alpha}{opacity of edges ranging from 0 to 1.0.}

\item{edge_size}{size of edges for most frequent co-occurrence The size of
other edges are determined proportionally to the highest frequency.}

\item{vertex_color}{color of vertices.}

\item{vertex_size}{size of vertices.}

\item{vertex_labelcolor}{color of texts. Defaults to the same as
\code{vertex_color}. If \code{NA} is given, texts are not rendered.}

\item{offset}{if \code{NULL}, the distance between vertices and texts are
determined automatically.}

\item{vertex_labelfont}{font-family of texts. Use default font if \code{NULL}.}

\item{...}{additional arguments passed to \link[network]{network}.}
}
\description{
Plot an \link{fcm} object as a network, where edges show co-occurrences of
features.
}
\details{
Currently the size of the network is limited to 1000, because of the
  computationally intensive nature of network formation for larger matrices.
  When the \link{fcm} is large, users should select features using
  \link{fcm_select}, set the threshold using \code{min_freq}, or implement
  own plotting function using \code{\link[=as.network.fcm]{as.network}}.
}
\examples{
\dontrun{
toks <- corpus_subset(data_corpus_irishbudget2010) \%>\%
    tokens(remove_punct = TRUE) \%>\%
    tokens_tolower() \%>\%
    tokens_remove(stopwords("english"), padding = FALSE)
myfcm <- fcm(toks, context = "window", tri = FALSE)
feat <- names(topfeatures(myfcm, 30))
textplot_network(myfcm, min_freq = 10)
fcm_select(myfcm, feat, verbose = FALSE) \%>\% textplot_network(min_freq = 0.5)
fcm_select(myfcm, feat, verbose = FALSE) \%>\% textplot_network(min_freq = 0.8)
fcm_select(myfcm, feat, verbose = FALSE) \%>\%
        textplot_network(min_freq = 0.8, vertex_labelcolor = rep(c('gray40', NA), 15))
}
}
\seealso{
\code{\link{fcm}}
}
\author{
Kohei Watanabe and Stefan Müller
}
\keyword{textplot}
