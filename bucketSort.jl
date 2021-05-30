#push!(push!(Array{Int, 1}[], a), b)
#push!(Array{Int, 1}[], A[i])

function bucketSort!(A)
    
    n = length(A)                               #duzina niza koji sortiramo
    B = push!(Array{Int, 1}[], [])              #ovo jedini nacin na koji sam uspeo da napravim niz u koji cu u sledecoj petlji moci da push!-ujem dtuge nizove

    for i in 1:9                                #potrebno je 10 bucketa, a radimo 1:9 jer smo u liniji 7 vec napravili jedan bucket
        B = push!(B, [])                        #push!-ujemo nove buckete u B
    end

    for i in 1:n                                #petlja za svrstavanje clanova niza u zavisnosti od range (tako bucketSort funckionise)
        x = Int(ceil(A[i]/10))                  #x je indeks za niz B; Int nam treba jer indeks mora biti tog tipa, a desni deo kao rezultat daje float;
                                                #ceil - jer u julia-i indeksi idu od 1, ako npr imam clan = 3 -> 3/10 = 0.3, i ovde ako bi radili floor ili round dobili bi 0
                                                #dok sa ceil-om dobijamo 1, sto je najmanji moguci indeks; 
        push!(B[x], A[i])                       #kada smo odredili indeks, odnosno bucket u koji ide trenutni clan, smestamo ga u B[i]
    end

    display(B)                                  #visak, tu je samo kao provera da li su se dobro rasporedili po bucketima
    j = 1                                       #koristimo u sledecoj petlji kao brojac za clanove niza A u koji cu nakon insertionSorta ispisati sortirani niz
    for i in 1:10                               #1:10 prolazim kroz sve buckete
        l = length(B[i])                        #duzina bucketa, kasnije necemo prepisivati iz tog bucketa ako je prazan (l = 0)
        insertionSort!(B[i])                    #pozivam funckiju insertionSort - jedna modifikacija samo!
        if l > 0                                #da li je prazan bucket?
            for k in 1:l                        #petlja za prolazak kroz sve clanove trenutnog (poslednjeg sortiranog) bucketa, od 1 do duzine tog bucketa
                A[j] = B[i][k]                  #B[i][k] -- preko i pristupamo trenutnom bucketu, a preko k trenutnom clanu tog bucketa 
                j = j + 1                       #kada upisemo clan u j, pomeramo se na sledecu poziciju
            end
        end
    end
    return B                                    #visak, tu je samo kao provera da li se dobro sortiralo posle insertionSorta
end

function insertionSort!(A)                      #obican insertionSort sa jednom izmenom:
    if length(A) > 1                            #ubacujemo proveru da li je bucket duzi od 1 clana, ako nije znaci da je ili prazan ili ima samo jednog clana - u oba slucaja sortiranje je suvisno
        for j in 2:length(A)
            key = A[j]
            i = j - 1
            while(i>0 && key<A[i])   
                A[i+1] = A[i]
                i= i - 1
            end
            A[i+1] = key
        end
    end
end

