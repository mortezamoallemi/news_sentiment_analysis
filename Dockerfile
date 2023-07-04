FROM rocker/shiny:4.2.1
RUN install2.r rsconnect tibble dplyr stringr rtweet htmltools lubridate bslib reactable
# Name or path of the app on shinyapp.io should be entered after "/home/"
WORKDIR /home/shinytweets 
COPY ui.R ui.R 
COPY server.R server.R 
# COPY likes.rds likes.rds # Copy any need data from the repo to the image
COPY deploy.R deploy.R
CMD Rscript deploy.R
