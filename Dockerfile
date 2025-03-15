FROM julia:1.10.4

RUN useradd --create-home --shell /bin/bash genie
RUN mkdir -p /home/genie/app
COPY . /home/genie/app
WORKDIR /home/genie/app
RUN chown -R genie:genie /home/genie
USER genie

## Install youtube transcript api
#RUN pip3 install youtube-transcript-api

EXPOSE 8000
EXPOSE 80
ENV JULIA_DEPOT_PATH "/home/genie/.julia"

RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.add(["Genie", "Colors", "Stipple"]); Pkg.precompile()'

ENTRYPOINT julia --project -e 'using Pkg; Pkg.instantiate(); using Genie; Genie.loadapp(); up(8000, "0.0.0.0", async=false);;'