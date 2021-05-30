include("bucketSort.jl")

A = Vector{Int}(ceil.(Int, rand(30)*100))       #pravi niz od 30 integera u range-u: [1, 100]
#A = [1, 13, 22, 14, 99, 100]                   #ili samostalno iskucati
println("\nNesortirani niz A:\n\n$A")

bucketSort!(A)                              
println("\nNiz A nakon sortiranja bucketSort metodom:\n\n$A")

