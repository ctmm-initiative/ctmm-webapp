% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1_ctmm_data.R
\name{assign_speed}
\alias{assign_speed}
\title{Calculate speed for each animal location}
\usage{
assign_speed(animals_dt, tele_list, device_error = 10)
}
\arguments{
\item{animals_dt}{location \code{data.table} from \code{\link[=combine]{combine()}}. The original input
\code{data.table} will be modified in place by reference after calculation.}

\item{tele_list}{the \code{\link[ctmm:as.telemetry]{ctmm::as.telemetry()}} telemetry obj list. Calculation
need error information from it.}

\item{device_error}{standardized device error in meter. Example: GPS: 10,
VHF: 100}
}
\value{
The input \code{data.table} with \code{assigned_speed} columns added. The name
\code{assign} hint on this nature.
}
\description{
It's difficult to get a simple speed definition yet robust to all kinds of
dirty data cases. A sophisticated method is attempt first which should cover
most common edge cases reasonably well. When it fails for extreme situations,
the function will fall back to simpler method which is more naive but robust.
}
\details{
To reduce duplicate calculation, speed calculation will use some columns
created in distance calculation. Always update \code{data.table} with
\code{\link[=assign_distance]{assign_distance()}} first then use \code{\link[=assign_speed]{assign_speed()}}.
}
