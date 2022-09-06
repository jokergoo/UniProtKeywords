\name{kw_terms}
\docType{data}
\alias{kw_terms}
\title{
Keyword terms
}
\description{
Keyword terms
}
\usage{
data(kw_terms)
}
\details{
Data is from \url{https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/docs/keywlist.txt}

Last updated: 2022-09-06.
}
\value{
A list of keyword terms. Each keyword term has the following elements:

\itemize{
  \item Identifier
  \item Accession
  \item Description
  \item Synonyms
  \item Gene_ontology
  \item Hierarchy
  \item WWW_site
  \item Category
}
}
\examples{
data(kw_terms)
kw_terms[[1]]
}
