# Tests for alignment related functions
set.seed(42)

# Tests for alignment (via AlignSubspace)
# --------------------------------------------------------------------------------
context("MultiCCA")


test_that("RunMultiCCA works with add.cell.ids", {
  pbmc_multi_cca <- RunMultiCCA(list(pbmc_small, pbmc_small, pbmc_small),
                                add.cell.ids = c("A", "B", "C"))
  expect_s4_class(pbmc_multi_cca, "seurat")
})

test_that("GroupedMultiCCA works with add.cell.ids", {
  pbmc_small@meta.data$group = 1:4
  pbmc_multi_cca <- GroupedMultiCCA(pbmc_small, group.by = "group")
  expect_s4_class(pbmc_multi_cca, "seurat")
})
