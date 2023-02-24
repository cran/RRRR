## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(RRRR)

## -----------------------------------------------------------------------------
data <- RRR_sim()
data

## -----------------------------------------------------------------------------
str(data)

## -----------------------------------------------------------------------------
res_gmle <- RRR(y=data$y, x=data$x, z = data$z)
res_gmle

## -----------------------------------------------------------------------------
res_gmle <- RRR(y=data$y, x=data$x, z=data$z, mu = FALSE)
res_gmle <- RRR(y=data$y, x=data$x, z=NULL, mu = TRUE)
res_gmle <- RRR(y=data$y, x=data$x, z=NULL, mu = FALSE)

## -----------------------------------------------------------------------------
res_mm <- RRRR(y=data$y, x=data$x, z = data$z, 
               itr = 100, 
               earlystop = 1e-4)
res_mm

## -----------------------------------------------------------------------------
plot(res_mm, aes_x = "iteration", xlog10 = TRUE)

## -----------------------------------------------------------------------------
res_smm <- ORRRR(y=data$y, x=data$x, z=data$z, 
                 initial_size = 100, addon = 10)
res_smm

## -----------------------------------------------------------------------------
plot(res_smm)

## ---- eval = FALSE------------------------------------------------------------
#  res_saa_optim <- ORRRR(y=data$y, x=data$x, z=data$z,
#                         method = "SAA", SAAmethod = "optim")
#  res_saa_mm <- ORRRR(y=data$y, x=data$x, z=data$z,
#                         method = "SAA", SAAmethod = "MM")

## -----------------------------------------------------------------------------
newdata <- RRR_sim()
res2_smm <- update(res_smm, newy=newdata$y, newx=newdata$x, newz=newdata$z)
res2_smm

