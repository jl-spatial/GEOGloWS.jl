"""
  path_join(arg...; sep="/")

Join path components into a full path.


```jldoctest
julia> path_join("c:/", "hello")
"c:/hello"

julia> path_join("c:", "hello")
"c:/hello"

julia> path_join("c:", "hello", "b"; sep="\\")
"c:\\hello\\b"

julia> path_join("c:", "hello/", "b"; sep="/")
"c:/hello/b"
```
"""

function _path_join(x::AbstractString, y::AbstractString; sep="/")
  if string(x[end]) == sep
    x * y
  else
    x * sep * y
  end
end

function path_join(arg...; sep="/")
  if length(arg) == 1
    arg[1]
  else
    _path_join(arg[1], path_join(arg[2:end]...; sep); sep)
  end
end

export path_join
