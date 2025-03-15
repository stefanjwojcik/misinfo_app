module App
using Main.MyController
using GenieFramework, PlotlyBase
using Genie.Renderer.Html

@genietools

@app begin
    #reactive code goes here
end

function ui()
    p("This is some text") #initialized to an empty paragraph
end

function root_ui()
    p("Welcome to the root page!")
end

@page("/", root_ui)

# Example route that uses gradient text
route("/gradient") do
  colors = ["#FF0000", "#FF7F00", "#FFFF00", "#00FF00", "#0000FF", "#4B0082", "#9400D3"]
  gradient_message = MyController.gradient_text("Welcome to Genie.jl with Rainbow Text!", colors)
  
  html("""
  <!DOCTYPE html>
  <html>
  <head>
      <title>Gradient Text Example</title>
      <style>
          body {
              font-family: Arial, sans-serif;
              font-size: 24px;
              text-align: center;
              margin-top: 100px;
          }
      </style>
  </head>
  <body>
      <div>$(gradient_message)</div>
  </body>
  </html>
  """)
end

end