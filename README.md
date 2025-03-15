---
title: Genie.jl on HuggingFace Demo
emoji: 🚀
colorFrom: green
colorTo: indigo
sdk: docker
app_port: 8000
pinned: false
license: apache-2.0
tags:
 - julia
 - Genie.jl
 - Stipple
---

This is a demo for using Genie.jl (A Julia lang Web Dev Framework) to deploy a webapp on Huggingface Docker Spaces!


Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference


## TODO LIST: 
- [x] Create a Genie.jl app
    - [x] Title Page and Logo
    - [x] Add an input for a youtube link (take from existing Genie.jl app)
    - [x] Add a button to submit the link
    - [x] Add a loading spinner
    - [x] Modify the HTML template on the backend 
    - [x] Generate Python code to access the transcripts 
    - [x] Script to send transcript to existing hf fact-check API 
    - [x] Processs scores and assign colors 
    - [x] Display the results w/ links to fact-checks
    - [x] Display numbered list of fact-checks w/ links
- [x] Create a Dockerfile
- [x] Create a Docker Space
- [x] Deploy the app on HuggingFace Spaces