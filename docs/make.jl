using psUtils
using Documenter

makedocs(;
    modules=[psUtils],
    authors="Johnny Chen <johnnychen94@hotmail.com>",
    repo="https://github.com/johnnychen94/psUtils.jl/blob/{commit}{path}#L{line}",
    sitename="psUtils.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://johnnychen94.github.io/psUtils.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/johnnychen94/psUtils.jl",
)
