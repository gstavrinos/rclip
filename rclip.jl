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
        while true
            pos = findfirst(d[i][1], clip_)
            if pos == nothing
                i += 1
                if i > length(d)
                    break
                end
            else
                println(clip_)
                println("BEFORE")
                println(clip_)
                println(clip)
                println(d[i][1])
                println(pos)
                clip_ = replace(clip_, d[i][1] => repeat(PLACEHOLDER, length(d[i][2])), count=1)
                #  _clip = collect(clip)
                c = ""
                #  deleteat!(_clip, pos)
                p = pos[1]
                if pos[1] > 1
                    c = clip[1:pos[1]-sizeof(clip[pos[1]])]
                end
                while true
                    if p > pos[length(pos)]
                        break
                    end
                    c *= clip[p]
                    p += sizeof(clip[p])
                end
                c *= d[i][2]

                if pos[length(pos)] < sizeof(clip)
                    c *= clip[pos[1]+sizeof(d[i][1])-sizeof(d[i][1][1]):length(clip)]
                end
                #  insert!(_clip, p, collect(d[i][2]))
                #  clip = String(_clip)
                #  clip = replace(clip, d[i][1] => d[i][2], count=1)
                clip = c
                println("AFTER")
                println(clip)
            end
        end

    end

    #  clipboard(clip)
    println(clip)

end

main()

