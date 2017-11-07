# install irlba 2.3.2 dev because 2.3.1 version (in bioconductor) has a bug
if(getOption("unzip") == "") options(unzip = 'internal')
devtools::install_github("bwlewis/irlba", ref = "d86b4e183b614748938017191948af499de8d6c9")
