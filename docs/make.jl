using PSUtil
using Documenter

makedocs(;
    modules=[PSUtil],
    sitename="PSUtil.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://johnnychen94.github.io/PSUtil.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/johnnychen94/PSUtil.jl",
)
