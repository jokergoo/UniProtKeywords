# Keywords from the UniProt database

UniProt database provides a list of controlled vocabulary represented as keywords
for genes or proteins (https://www.uniprot.org/keywords/). This is useful for summarizing gene functions in a compact way. This package
provides data of keywords hierarchy and gene-keywords relations.


### Install

If you want the latest version, install it directly from GitHub:

```r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("jokergoo/UniProtKeywords")
```

### Usage


First load the package.

```r
library(UniProtKeywords)
```

The package has five datasets. The first contains basic information of every keyword term:

```r
data(kw_terms)
kw_terms[[1]]
```


The other four contain hierarchical structures of the keyword terms:

```r
data(kw_parents)
kw_parents[1:2]

data(kw_children)
kw_children[1:2]

data(kw_ancestors)
kw_ancestors[1:2]

data(kw_offspring)
kw_offspring[1:2]
```

The **UniProtKeywords** package has also compiled genesets of keywords for some species, which can get by the function `load_keyword_genesets()`.
The argument is the taxon ID of a species:

```r
gl = load_keyword_genesets(9606)
gl[1:2]
```

### License

MIT @ Zuguang Gu


