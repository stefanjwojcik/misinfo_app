module App
using Main.MyController
include("lib/Transcriber.jl")
using .Transcriber
using GenieFramework, PlotlyBase
using Genie.Renderer.Html

#using GenieFramework; Genie.loadapp(); up()

@genietools

@app begin
    @in process = false
    @in url = "SW14tOda_kI"
    @out transcription = ""
    @in transcribe = false
    @in download = false
    @out transcribing = false
    @out downloading = false
    @onchange transcribe begin
        @info "Transcribing $url"
        transcribing = true
        transcription = Transcriber.get_transcript_text_only(url)
        transcription = MyController.generate_example(transcription)
        transcribing = false
    end
    @onchange download begin
        @info "Downloading $url"
        downloading = true
        ## TODO: download the transcription
        downloading = false
    end
end

function ui()
    [
        h2("Youtube video Fact-Checker")
        input("url", :url, style="width:500px")
        # button("Transcribe", @click("process = !process"))
        button("Transcribe", @click("transcribing = true"), loading=:transcribing)
        button("Download", @click("download = !download; downloading=true"), loading=:downloading)
        h4("Transcription:")
        p("{{transcription}}")
    ]
end

@page("/", "app.jl.html")

# Example route that uses gradient text
route("/gradient") do
    message = "this is a message"
   gradient_message = MyController.generate_example(message)
end

end