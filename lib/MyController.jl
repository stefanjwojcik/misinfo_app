module MyController
using Genie
using Genie.Renderer.Html

function gradient_text(text::String, colors::Vector{String})
    # Create span elements for each character with gradient colors
    spans = []
    total_chars = length(text)
    
    for (i, char) in enumerate(text)
        # Calculate color index based on position
        color_index = floor(Int, (i-1) / total_chars * (length(colors) - 1)) + 1
        color = colors[color_index]
        
        # Create span with specific color
        push!(spans, "<span style=\"color: $(color);\">$(char)</span>")
    end
    
    # Join all spans
    return join(spans)
end

# Add a function to render a page with the gradient text
function gradient_page(text::String, colors::Vector{String})
    gradient_message = gradient_text(text, colors)
    
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

end # end module