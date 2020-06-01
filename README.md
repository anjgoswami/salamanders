Data and code associated with Fabre et al., *Nature Ecology and Evolution* 2020
=======

Including:

Coordinates_superimposed_entire_dataset: Categories, centroid size, and rocrustes coordinates for landmarks and sliding semilandmarks for the entire dataset in the following order: 1) species name in phylogeny, 2) species name in collection, 3) family, 4) life cycle, 5) fine-grained classification of life cycle, 6) locomotion, 7) centroid size, 8-2824) Procrustes coordinates.

salamandra_salamandra_landmark: sample landmark dataset for one specimen to plot landmarks on mesh

salamandra_salamandra_mesh: mesh associated with sample landmark data above

Phylogeny_MCC_pruned: phylogeny of Caudata

scaled_tree: rate-scaled tree from BayesTraits used in subsequent analyses

Module_definition: table of module hypotheses used in EMMLi analyses

layout_Emmli: format for generating network plot of EMMLi results with bones in relative position

Script_BM_rj_MCMC_bayestrait: input for BayesTraits analysis

VarRates: Transforms applied to the tree from the variable rates and local transform models

Output.trees: output trees scaled by variables rates or other transforms, saved in nexus format

mytreerateplotter: R code for plotting output of BayesTraits analyses on trees. This is a modification of the function “plotBranchbyTrait” from the R package “phytools”. 

Code for parsing rates and variance by landmarks is available at https://github.com/rnfelice/hot.dots

All PLY files of specimens are available on Phenome10k.org, Morphosource, and Digimorph

