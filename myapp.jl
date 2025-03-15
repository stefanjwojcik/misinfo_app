module myapp

using Genie.Renderer.Html

############## FUNCTIONS ##############
function color_text(text_chunks::Vector{String}, color_values::Vector{String})
    # Ensure text_chunks and color_values have the same length
    if length(text_chunks) != length(color_values)
        throw(ArgumentError("Text and color arrays must have the same length"))
    end

    # Create HTML with colored spans
    html = "<p>"
    for (text, color) in zip(text_chunks, color_values)
        html *= """<span style="color: $color;">$text</span> """
    end
    html *= "</p>"

    return html_safe(html)  # Use html_safe to mark the HTML as safe to render
end

text_chunks = ["Hello", "world", "this", "is", "Genie.jl!"]
color_values = ["#ff0000", "#00ff00", "#0000ff", "#ff00ff", "#00ffff"]

function mycontroller()
    html = color_text(text_chunks, color_values)
    return html
end

using Colors

function generate_gradient(start_color::Color, end_color::Color, num_steps::Int)
    gradient = []
    for i in 0:num_steps-1
        ratio = i / (num_steps - 1)
        color = blend(start_color, end_color, ratio)
        push!(gradient, string(color))
    end
    return gradient
end


start_color = RGB(1, 0, 0)  # Red
end_color = RGB(0, 0, 1)    # Blue
color_values = generate_gradient(start_color, end_color, length(text_chunks))

mycolortext = color_text(text_chunks, color_values)

#h1(mycolortext)

function ui()
    [
        h2("Youtube video transcriber")
        input("url", :url, style="width:500px")
        # button("Transcribe", @click("process = !process"))
        button("Transcribe", @click("transcribing = true"), loading=:transcribing)
        button("Download", @click("download = !download; downloading=true"), loading=:downloading)
        h4("Transcription:")
        p("{{transcription}}")
    ]
end

@page("/", "app.jl.html")
Server.up()

end