\name{load_keyword_genesets}
\alias{load_keyword_genesets}
\title{
Load keyword genesets for a specific species
}
\description{
Load keyword genesets for a specific species
}
\usage{
load_keyword_genesets(taxon_id = 9606, category = NULL, as_table = FALSE)
}
\arguments{

  \item{taxon_id}{The taxon ID.}
  \item{category}{Category of keywords. There are the following categories: "Biological process", "Cellular component", "Coding sequence diversity", "Developmental stage", "Disease", "Domain", "Ligand", "Molecular function", "Post-translational modification", "Technical term". }
  \item{as_table}{If true, the returned value will be a two-column data frame.}

}
\details{
Following are the supported species (with more than 1000 genes annotated):

\itemize{
  \item "10090": Mus musculus / house mouse
  \item "10116": Rattus norvegicus / Norway rat
  \item "208964": Pseudomonas aeruginosa PAO1 / strain, g-proteobacteria
  \item "224308": Bacillus subtilis subsp. subtilis str. 168 / strain, firmicutes
  \item "237561": Candida albicans SC5314 / strain, budding yeasts
  \item "243232": Methanocaldococcus jannaschii DSM 2661 / strain, euryarchaeotes
  \item "284812": Schizosaccharomyces pombe 972h- / strain, ascomycete fungi
  \item "3702": Arabidopsis thaliana / thale cress
  \item "39947": Oryza sativa Japonica Group / (Japanese rice), monocots
  \item "44689": Dictyostelium discoideum / species, cellular slime molds
  \item "559292": Saccharomyces cerevisiae S288C / strain, budding yeasts
  \item "6239": Caenorhabditis elegans / species, nematodes
  \item "623": Shigella flexneri / species, enterobacteria
  \item "7227": Drosophila melanogaster / (fruit fly), species, flies
  \item "7955": Danio rerio / (zebrafish), species, bony fishes
  \item "83332": Mycobacterium tuberculosis H37Rv / strain, high G+C Gram-positive bacteria
  \item "83333": Escherichia coli K-12 / strain, enterobacteria
  \item "83334": Escherichia coli O157:H7 / serotype, enterobacteria
  \item "8355": Xenopus laevis / (African clawed frog), species, frogs & toads
  \item "8364": Xenopus tropicalis / (tropical clawed frog), species, frogs & toads
  \item "9031": Gallus gallus / (chicken), species, birds
  \item "9601": Pongo abelii / (Sumatran orangutan), species, primates
  \item "9606": Homo sapiens / human
  \item "9823": Sus scrofa / (pig), species, even-toed ungulates
  \item "9913": Bos taurus / cattle
  \item "99287": Salmonella enterica subsp. enterica serovar Typhimurium str. LT2 / strain, enterobacteria
}
}
\value{
If \code{as_table} is set to \code{FALSE}, it returns a list of gene sets where Entrez IDs are the gene IDs.
If \code{as_table} is set to \code{TRUE}, it returns a two-column data frame.
}
\examples{
lt = load_keyword_genesets(9606)
lt[3:4]
tb = load_keyword_genesets(9606, as_table = TRUE)
head(tb)
}
