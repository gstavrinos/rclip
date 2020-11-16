#!/bin/env julia
using InteractiveUtils

const PLACEHOLDER = "|"

function main()
    clip = clipboard()
    clip_ = String(clip)

    if !isempty(ARGS)

        d = []

        for i in readlines(ARGS[1])
            s = split(i)
            push!(d, [String(s[1]),String(s[2])])
        end

        sort!(d, rev=true, lt=(x,y)->isless(length(x[1]),length(y[1])))

        i = 1
        while i <= length(d)
            pos = findfirst(d[i][1], clip_)
            if pos == nothing
                i += 1
            else
                clip_ = replace(clip_, d[i][1] => repeat(PLACEHOLDER, sizeof(d[i][2])), count=1)
                c = ""
                if pos[1] > 1
                    c *= clip[1:prevind(clip, pos[1])]
                end
                c *= d[i][2]
                replace_end = nextind(clip, last(pos))
                if replace_end <= lastindex(clip)
                    c *= clip[replace_end:lastindex(clip)]
                end
                clip = c
            end
        end

    end

    clipboard(clip)

end

main()

