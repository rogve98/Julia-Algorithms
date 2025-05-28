"""
21Oct2024
Funciones de la página de Euler que servirán para ir practicando habilidades de programación. Veremos la dificultad de los ejercicios

1. multiplos3y5(): Dado un número se brindan todos sus múltiplos en el rango de 1 a dicho número
2. imparesFibonacci(): Devuelve todos los términos impartes de la serie de Fibonacci
3. factoresPrimos(): Devuelve todos los factores primos de un número dado
bonus 0. ispalindrome(): devuelve verdadero o falso testeando un número si es palíndromo.
bonus 1. permuteVect(): brinda una permutación hacia la derecha
bonus 2. factoresde2(): brinda 2 factores de dos dígitos dado un número
bonus 3. factoresde3(): brinda 2 factores de tres dígitos dado número
bonus 4. largestpalindrome(): brinda el palíndromo más grande como producto de dos factores de 2 y 3 dígitos (es ineficiente)
4. largestPalindrome(): palíndromo más grande como producto de dos números de 3 dígitos.
bonus 5. isprime(): Sirve para determinar si un número dado es primo.
5. smallestFactors(): determina el número más pequeño formado por factores del 1 al 20.
6. sumSquareDifference(): Resta de la suma del 1 al 20 del cuadrado con los cuadrados del 1 al 20.
bonus 6. primosHastaN(): Determina el conjunto de números primos dada una cota superior N.
7. primos(): Regresa una lista con los N+1 primeros primos.i
8. greatestFactor1000(): Dada una lista de 1000 dígitos enteros, se encuentra el producto más grande de un slice de 13 factores
9. tripletePitagoras(): Regresa 3 coeficientes que su suma es igual a 100 y son parte de un triplete pitagórico.
"""

#Múltiplos de 3 y 5: Completado

function multiplos3y5(n::Int)
    multiplos = []
    for i in range(1,n-1)    
        mod(i,3) == 0 || mod(i,5) == 0 ? push!(multiplos,i) : continue
    end
    return sum(multiplos)
end

#Suma de impares de Fibonacci: Completado

function imparesFibonacci(n::Int)
    f0,f1 = 1,2
    sum = 0
    while f0 < n
        if iseven(f0) sum+=f0 end
        f0,f1 = f1,f1+f0
    end
    return sum
end

#Factores primos: Completado

function factoresPrimos(n::Int)
    i = 2
    primos = []
    while n > 1
        if mod(n,i) == 0 
            push!(primos,i) 
            n /= i
        else
            i += 1
        end
    end
    return primos
end

#Complemento para saber si un número es palíndromo. 

function ispalindrome(n::Int)
    s = string(n)
    if s == s[end:-1:1]
        return true
    else
        return false
    end
end

#Función para realizar permutaciones hacia la derecha. El ';' concatena vectores en uno solo, equivalente a vcat(v...) y hcat(v...)

permuteVect(v::Vector) = [v[end];v[1:end-1]]

#Función para determinar 2 factores de dos dígitos

function factoresde2(n::Int)
    factores = factoresPrimos(n)
    resultado = []
    for i in eachindex(factores)
        for j in i:length(factores)
            factor1 = factores[i]*factores[j]
            factor2 = n/factor1
            if mod(n,factor2) == 0 && isinteger(factor2) && length(string(Int(factor2))) == 2 && length(string(factor1)) == 2
                push!(resultado,factor1,Int(factor2))
            end
        end
    end
    return resultado        
end

#Función para determinar 2 factores de tres dígitos

function factoresde3(n::Int)
    factores = factoresPrimos(n)
    resultado = []
    for i in eachindex(factores)
        for j in i:length(factores)
            factor1 = factores[i]*factores[j]
            factor2 = n/factor1
            if mod(n,factor2) == 0  && isinteger(factor2)
                if length(string(factor1)) == 3 && length(string(Int(factor2))) == 3  
                    push!(resultado,factor1,Int(factor2))
                end
            end
        end
    end
    return resultado    
end


#Función para hallar el palíndromo más grande como producto de dos números de 3 dígitos. Desgraciadamente esta versión aunque interesante es
#sumamente ineficiente, se tarda mucho para encontrar el palíndromo correspondiente.

function largestpalindrome(digitos::Int)
    if digitos == 3
        N = 999*999
        n = 100*100
        resultado = []
        for palindromo in N:-1:n
            factores = factoresde3(palindromo)
            if ispalindrome(palindromo)
                if factores != [] 
                    push!(resultado,palindromo) 
                    break
                end
            end
        end
        return resultado
    elseif digitos == 2
        N = 99*99
        n = 10*10
        resultado = []
        for palindromo in N:-1:n
            if ispalindrome(palindromo)
                factores = factoresde2(palindromo)
                if factores != [] 
                    push!(resultado,palindromo)
                    break
                end
            end                
        end
        return resultado
    end
end

#Alternativa más eficiente de largestpalindrome, mucho máaaas eficiente: Completado.

function largestPalindrome()
    vals = collect(999:-1:100)
    resultado = 0
    factores = [0,0]
    for i in vals
        for j in vals
            if ispalindrome(i*j) && i*j > resultado
                resultado = i*j
                factores[1], factores[2] = i,j
            end
        end
    end
    return resultado,factores
end

#Función para determinar si el número es primo

function isprime(n::Union{Int,Float64})
    if n < 2 
        return false 
    end
    for i in 2:floor(Int,sqrt(n))
        if mod(n,i) == 0
            return false           
        end
    end
    return true
end

#Función para determinar el 

function smallestFactors(n::Int)
    resultado = []
    for factor in 2:n
        if isprime(factor)
            push!(resultado,factor)
        else
            for primo in resultado
                if mod(factor,primo) == 0 factor/=primo end
            end 
            if isprime(factor) push!(resultado,Int(factor)) end
        end
    end
    return resultado#prod(resultado)
end
           
#Este estuvo fácil. Resta de la suma del 1 al 20 del cuadrado con los cuadrados del 1 al 20: Completado
            
function sumSquareDifference(n::Int)
    cuadrados = 0
    cuadrado = 0
    for i in 1:n
        cuadrados+=i^2
        cuadrado+=i
    end
    cuadrado = cuadrado^2
    return cuadrado - cuadrados
end

#Primos hasta una cota superior N, devuelve una lista de primos truncada hasta cierto número N

function primosHastaN(N::Int)
    primos = [2]
    for i in 3:N
        es_primo = true
        limite = sqrt(i)
        for primo in primos
            if primo > limite
                break
            end
            if mod(i,primo) == 0
                es_primo = false
                break
            end
        end
        if es_primo
            push!(primos,i)
        end
    end
    return primos
end

#Primo número 10 001

function primos(N::Int=10_000)
    primos = [2]
    i = 3
    while length(primos) <= N
        es_primo = true
        limite = isqrt(i)
        for primo in primos
            if primo > limite break end
            if mod(i,primo) == 0
                es_primo = false
                break
            end
        end
        if es_primo push!(primos,i) end
        i+=1
    end
    return primos
end

#Función para determinar el producto más grande dados 4 factores en un número de 1000 dígitos.

function greatestFactor1000(num::String,j::Int)
    num = replace(num,"\n" => "")
    greatest = 0
    fs = [[7,3,1,6]]
    for i in 1:length(num)-j
        factores = num[i:i+j-1]
        lista = [parse(Int,s) for s in factores]
        if prod(lista) > greatest
            greatest = prod(lista)
            fs = replace(fs,fs[1] => lista)
        end
    end
    return greatest,fs         
end

#Función para determinar el triplete pitagórico tal que la suma de sus raíces es igual a 1000

function tripletePitagoras()
    resultado = []
    for i in 1:1000
        for j in i:1000
            if isinteger(i^2+j^2) && (i+j+sqrt(i^2+j^2))==1000
                push!(resultado,i,j,Int(sqrt(i^2+j^2)))
            end
        end
    end
    return prod(resultado)
end

#Función para determinar la suma de los primeros N números primos

function sumadePrimos(N::Int)
    return sum(primosHastaN(N))    
end

#Función para determina el producto más grande de 4 factores de una matriz de 20x20

function largestProduct(num::String)
    M = reshape(parse.(Int,split(num)),(20,20))
    largeH = 0
    largeV = 0
    largeD = 0
    largeDi = 0
    for i in range(1,20)
        for j in range(1,20)
            if j <= 17 && prod(M[i,j:j+3]) > largeH
                largeH = prod(M[i,j:j+3])
            end
            if i <= 17 && prod(M[i:i+3,j]) > largeV
                largeV = prod(M[i:i+3,j])
            end
            if j <= 17 && i <= 17 && prod([M[i,j],M[i+1,j+1],M[i+2,j+2],M[i+3,j+3]]) > largeD
                largeD = prod([M[i,j],M[i+1,j+1],M[i+2,j+2],M[i+3,j+3]])
            end
            if i <= 17 && j >= 4 && prod([M[i,j],M[i+1,j-1],M[i+2,j-2],M[i+3,j-3]]) > largeDi
                largeDi = prod([M[i,j],M[i+1,j-1],M[i+2,j-2],M[i+3,j-3]])
            end
        end
    end
    return (largeH,largeV,largeD,largeDi)
end

#Función que determina los factores dado un número

function factores(num::Int)
    resultado = []
    for i in range(1,num)
        if mod(num,i) == 0 push!(resultado,i) end
    end
    return resultado    
end



#Función para determinar cuantos divisores (Factores) tiene un número

function factoresCota(cota_superior::Int)
    resultado = []
    n = 1
    while (length(resultado) < cota_superior)
        triangulo = n*(n+1)/2
        resultado = []
        for i in range(2,triangulo)
            if mod(triangulo,i) == 0
                push!(resultado,i)
            end
        end
        n+=1
    end
    return n-1,resultado
end

function factoresNumsTriangulares(cota::Int)
    contador  = 0
    n = 1
    while contador < cota
        contador = 0
        gauss_num = n*(n+1)/2
        for i in 1:gauss_num
            if mod(gauss_num,i) == 0 contador+=1  end
        end
        n+=1
    end
    return contador,n-1
end
