"""
21Oct2024
Funciones de la página de Euler que servirán para ir practicando habilidades de programación. Veremos la dificultad de los ejercicios
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

#Segundo complemento para saber los factores de dos dígitos

function factoresde2(n::Int)
    factores = factoresPrimos(n)
    resultado = []
    j = 1
    while length(resultado) == 2 
        if length(string(Int(n/primo))) <= 2
            push!(resultado,primo)
        else
            
        
end

