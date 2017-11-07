url <- "http://bioconductor.org/packages/3.6/bioc"

if ("BiocInstaller" %in% rownames(installed.packages()))
    remove.packages("BiocInstaller")

install.packages("BiocInstaller", repos=url)

builtins <- c("Matrix", "KernSmooth", "mgcv")

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        BiocInstaller::biocLite(builtin)

suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))
