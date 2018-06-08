#how to get cca plots to potentially work

install.packages("devtools")
devtools::install_github("gavinsimpson/ggvegan")
Next, do a CCA, here I'm using the example from ?cca

library("vegan")
library("ggvegan")
data(varespec, varechem)
vare.cca <- cca(varespec, varechem)
Then, to generate a ggplot version of the CCA triplot, use:

autoplot(vare.cca)