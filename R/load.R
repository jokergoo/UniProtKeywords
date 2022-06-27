
# == title
# Load keyword genesets for a specific species
#
# == param
# -taxon_id The taxon ID.
# -category Category of keywords. There are the following categories: "Biological process", "Cellular component", "Coding sequence diversity", "Developmental stage", "Disease", "Domain", "Ligand", "Molecular function", "Post-translational modification", "Technical term". 
#
# == details
# Following are the supported species (with more than 1000 genes annotated):
#
# -9606 Homo sapiens / human
# -10090 Mus musculus / house mouse
# -3702 Arabidopsis thaliana / thale cress
# -10116 Rattus norvegicus / Norway rat
# -559292 Saccharomyces cerevisiae S288C / strain, budding yeasts
# -9913 Bos taurus / cattle
# -284812 Schizosaccharomyces pombe 972h- / strain, ascomycete fungi
# -224308 Bacillus subtilis subsp. subtilis str. 168 / strain, firmicutes
# -83333 Escherichia coli K-12 / strain, enterobacteria
# -44689 Dictyostelium discoideum / species, cellular slime molds
# -39947 Oryza sativa Japonica Group / (Japanese rice), monocots
# -6239 Caenorhabditis elegans / species, nematodes
# -7227 Drosophila melanogaster / (fruit fly), species, flies
# -8355 Xenopus laevis / (African clawed frog), species, frogs & toads
# -7955 Danio rerio / (zebrafish), species, bony fishes
# -83332 Mycobacterium tuberculosis H37Rv / strain, high G+C Gram-positive bacteria
# -9601 Pongo abelii / (Sumatran orangutan), species, primates
# -83334 Escherichia coli O157:H7 / serotype, enterobacteria
# -9031 Gallus gallus / (chicken), species, birds
# -99287 Salmonella enterica subsp. enterica serovar Typhimurium str. LT2 / strain, enterobacteria
# -623 Shigella flexneri / species, enterobacteria
# -8364 Xenopus tropicalis / (tropical clawed frog), species, frogs & toads
# -208964 Pseudomonas aeruginosa PAO1 / strain, g-proteobacteria
# -243232 Methanocaldococcus jannaschii DSM 2661 / strain, euryarchaeotes
# -9823 Sus scrofa / (pig), species, even-toed ungulates
# -237561 Candida albicans SC5314 / strain, budding yeasts
#
# == value
# A list of gene sets where Entrez IDs are the gene IDs.
#
# == example
# lt = load_keyword_genesets(9606)
# lt[1:2]
load_keyword_genesets = function(taxon_id = 9606, category = NULL) {

	f = system.file("extdata", "keywords_anno", paste0("keywords_", taxon_id, "_gene_annotation.rds"), package = "UniProtKeywords")
	if(file.exists(f)) {
		lt = readRDS(f)
	} else {
		stop(paste0("Species ", taxon_id, " is not supported."))
	}

	if(!is.null(category)) {

		diff = setdiff(category, ALL_KEYWORDS_CATEGORIES)
		if(length(setdiff(category, ALL_KEYWORDS_CATEGORIES)) == 1) {
			stop(paste0("Following value for `category` is not allowed: ", diff))
		} else if(length(setdiff(category, ALL_KEYWORDS_CATEGORIES)) > 1) {
			stop(paste0("Following values for `category` are not allowed: ", paste(diff, collapse = ", ")))
		}

		l = vapply(names(lt), function(nm) {
			any(kw_terms[[nm]]$Category %in% category)
		}, TRUE)
		lt = lt[l]
	}
	return(lt)
}

ALL_KEYWORDS_CATEGORIES = c("Biological process", "Cellular component", "Coding sequence diversity", 
	                        "Developmental stage", "Disease", "Domain", "Ligand", "Molecular function", 
	                        "Post-translational modification", "Technical term")


.onLoad <- function(lib, pkg) {
	data(kw_terms, package = pkg, envir = topenv())
}

