include("bucketSort.jl")

A = Vector{Int}(ceil.(Int, rand(30)*100))       #pravi niz od 30 integera u range-u: [1, 100]
#A = [1, 13, 22, 14, 99, 100]                   

B = bucketSort!(A)                              #ova linije ne treba inace, za projekat je potrebno da se umesto nje kuca 7. linija, ovde radim ovako kako bih mogao da vidim sta mi se desava sa B, odnosno bucketima
#bucketSort!(A)
display(B)  
println("Niz A nakon sortiranja bucketSort metodom: $A")
