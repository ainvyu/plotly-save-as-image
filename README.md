This is example source for plotly save image using Selenium

# Background

Plotly rendered at the browser level, you need a web browser even if you use [the documentation method][1]

It is difficult to save images on headless server, So I try to solve it by using selenium.


# Init

    make init
    
# Build docker environment

    make docker-build
   
# Run docker

    make docker-run
    
Then you may see plotly screenshot file in output directory.

[1]: https://plot.ly/python/static-image-export/#export-static-image-offline