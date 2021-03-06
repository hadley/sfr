% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sfc.R, R/sf.R
\name{st_geometry}
\alias{st_geometry}
\alias{st_geometry.sf}
\alias{st_geometry.sfc}
\alias{st_geometry.sfg}
\alias{st_geometry<-}
\title{Get, set, or replace geometry from an sf object}
\usage{
\method{st_geometry}{sfc}(obj, ...)

st_geometry(obj, ...)

\method{st_geometry}{sf}(obj, ...)

\method{st_geometry}{sfc}(obj, ...)

\method{st_geometry}{sfg}(obj, ...)

st_geometry(x) <- value
}
\arguments{
\item{obj}{object of class \code{sf} or \code{sfc}}

\item{...}{ignored}

\item{x}{object of class \code{data.frame}}

\item{value}{object of class \code{sfc}}
}
\value{
st_geometry returns an object of class \link{sfc}, a list-column with geometries

\code{st_geometry} returns an object of class \link{sfc}. Assigning geometry to a \code{data.frame} creates an \link{sf} object, assigning it to an \link{sf} object replaces the geometry list-column.
}
\description{
Get, set, or replace geometry from an sf object
}
\examples{
df = data.frame(a = 1:2)
sfc = st_sfc(st_point(c(3,4)), st_point(c(10,11)))
st_geometry(sfc)
st_geometry(df) <- sfc
class(df)
st_geometry(df)
st_geometry(df) <- sfc # replaces
}

