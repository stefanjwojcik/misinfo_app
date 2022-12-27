FROM julia:1.8

WORKDIR /app

COPY ./ /app

RUN julia -e 'using Pkg; Pkg.activate(".") Pkg.add("Stipple"); '

CMD ["julia", "-e", "using Pkg; Pkg.activate(\".\"); include(\"src/app.jl\")"]
