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
            
            
              
