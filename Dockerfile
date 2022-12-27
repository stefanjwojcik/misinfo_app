FROM julia:1.8

WORKDIR /app

COPY ./ /app
EXPOSE 8760
RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.add("Stipple"); include("src/app.jl");'

