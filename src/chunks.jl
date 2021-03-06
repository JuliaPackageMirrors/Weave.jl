
type WeaveDoc
    source::AbstractString
    basename::AbstractString
    path::AbstractString
    chunks::Array
    cwd::AbstractString
    format
    doctype::AbstractString
    function WeaveDoc(source, chunks)
        path, fname = splitdir(abspath(source))
        basename = splitext(fname)[1]
        new(source, basename, path, chunks, "", nothing, "")
    end
end

immutable ChunkOutput
    code::AbstractString
    stdout::AbstractString
    displayed::AbstractString
    rich_output::AbstractString
    figures::Array{AbstractString}
end

type CodeChunk
    content::AbstractString
    number::Int
    result_no::Int
    start_line::Int
    optionstring::AbstractString
    options::Dict{Symbol, Any}
    output::AbstractString
    rich_output::AbstractString
    figures::Array{AbstractString}
    result::Array{ChunkOutput}
    function CodeChunk(content, number, start_line, optionstring, options)
        new(content, number, 0, start_line, optionstring, options, "","", AbstractString[], ChunkOutput[])
    end
end

type DocChunk
    content::AbstractString
    number::Int
    start_line::Int
end

type TermResult
end

type ScriptResult
end

type CollectResult
end
