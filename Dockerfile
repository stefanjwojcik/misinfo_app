FROM julia:1.8

WORKDIR /app

COPY ./ /app
RUN julia -e 'import Pkg; Pkg.add("Stipple")'
RUN julia -e 'using Pkg; Pkg.add("Stipple"); Pkg.activate(".")'

CMD ["julia", "src/app.jl"]
