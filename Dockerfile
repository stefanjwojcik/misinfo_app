FROM julia:1.8

RUN useradd --create-home --shell /bin/bash genie
RUN mkdir /home/genie/app
COPY . /home/genie/app
WORKDIR /home/genie/app
RUN chown -R genie:genie /home/
USER genie

EXPOSE 8760
EXPOSE 80
ENV JULIA_DEPOT_PATH "/home/genie/.julia"
ENV GENIE_ENV "prod"

RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.add("Stipple"); Pkg.precompile()'


CMD julia --project -e 'using Pkg; Pkg.instantiate(); include("src/app.jl");'