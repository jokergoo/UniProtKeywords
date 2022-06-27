
test_that("load_keyword_genesets", {
	load_keyword_genesets(9606)
	load_keyword_genesets(10090)
	load_keyword_genesets(category = "Domain")

	expect_error(load_keyword_genesets(12345), "not supported")
	expect_error(load_keyword_genesets(category = "aaa"), "not allowed")
})