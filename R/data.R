
# == title (variable:UniProtKeywords)
# Release and source information
#
# == example
# UniProtKeywords
UniProtKeywords = list(
	release = "2023_04 of 13-Sep-2023",
	built_date = "2023-09-23",
	source = "https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/docs/keywlist.txt"
)
class(UniProtKeywords) = "UniProtKeywords_info"

# == title
# Print the UniProtKeywords object
#
# == param
# -x A ``UniProtKeyword`` object.
# -... Other arguments
#
# == example
# UniProtKeywords
print.UniProtKeywords_info = function(x, ...) {
	cat("UniProt Keywords\n")
	cat("  Release:", x$release, "\n")
	cat("  Source:", x$source, "\n")
	cat("  Number of keywords:", length(kw_terms), "\n")
	cat("  Built date:", x$built_date, "\n")
}

# == title (data:kw_terms)
# Keyword terms
#
# == details
# Data is from https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/docs/keywlist.txt
#
# Last updated: 2023-09-23.
#
# == value
# A list of keyword terms. Each keyword term has the following elements:
#
# - Identifier
# - Accession
# - Description
# - Synonyms
# - Gene_ontology
# - Hierarchy
# - WWW_site
# - Category
#
# == example
# data(kw_terms)
# kw_terms[[1]]
#



# == title (data:kw_parents)
# Parents keyword terms
#
# == value
# A list of parent keywords.
#
# == example
# data(kw_parents)
# kw_parents[1:2]
#

# == title (data:kw_children)
# child keyword terms
#
# == value
# A list of child keywords.
#
# == example
# data(kw_children)
# kw_children[1:2]
#

# == title (data:kw_ancestors)
# Ancestor keyword terms
#
# == value
# A list of ancestor keywords.
#
# == example
# data(kw_ancestors)
# kw_ancestors[1:2]

# == title (data:kw_offspring)
# Offspring keyword terms
#
# == value
# A list of offspring keywords.
#
# == example
# data(kw_offspring)
# kw_offspring[1:2]

