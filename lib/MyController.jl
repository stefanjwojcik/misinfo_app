module MyController
using Genie
using Genie.Renderer.Html
using Colors
using OrderedCollections

function scores_to_colors(scores::Vector{T}) where T <: Real
    # Create a color gradient from red to blue
    c1 = colorant"red"
    c2 = colorant"blue"
    colors = hex.(range(c1, stop=c2, length=length(unique(scores))))
    colors = ["#" * color for color in colors]
    # Map scores to colors
    return Dict(zip(unique(scores), colors))
end

function gradient_text(textdict::OrderedDict{String, T}, colordict::Dict{T, String}) where T <: Real
    # Create span elements for each character with gradient colors
    spans = []
    
    for textval in keys(textdict)
        # Get the score for the current character
        score = textdict[textval]
        color = colordict[score]
        # Create span with specific color
        push!(spans, "<span style=\"color: $(color);\">$(textval)</span>")
    end
    
    # Join all spans
    return join(spans, " ")
end

# Add a function to render a page with the gradient text
function gradient_page_old(textdict::OrderedDict{String, T}, colordict::Dict{T, String}) where T <: Real
    gradient_message = gradient_text(textdict, colordict)
    
    return html("""
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
        <div>$(Html.embed(gradient_message))</div>
    </body>
    </html>
    """)
end

# Add a function to render a page with the gradient text
function gradient_page(textdict::OrderedDict{String, T}, colordict::Dict{T, String}) where T <: Real
    gradient_message = gradient_text(textdict, colordict)
    
    return Html.embed(gradient_message)
end

function generate_example(text::String)
    # Create a dictionary with the text and random scores
    textdict = OrderedDict{String, Float64}()
    for word in split(text, " ")
        textdict[word] = rand()
    end
    
    # Create a color gradient from red to blue
    scores = collect(values(textdict))
    colordict = scores_to_colors(scores)
    
    return gradient_text(textdict, colordict)
end

end # end module