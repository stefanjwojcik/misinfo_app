## Julia py_init file 
module Transcriber 

using PyCall

function __init__()

    py"""
    from youtube_transcript_api import YouTubeTranscriptApi 

    def get_transcript(video_id):
        return YouTubeTranscriptApi.get_transcript(video_id)
    """
end

# test id: "SW14tOda_kI"
# get_transcript("SW14tOda_kI")
function get_transcript(video_id::String)
    transcript = py"get_transcript"(video_id)
    return transcript
end

function get_transcript_text_only(video_id::String)
    transcript = get_transcript(video_id)
    text = ""
    for line in transcript
        text *= line["text"]
    end
    return text
end

end