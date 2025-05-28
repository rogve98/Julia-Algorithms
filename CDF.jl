"""
Distribución de probabilidad cumulativa

se ocupará f(x) = x<0 ? x+1 : x-1 como variable aleatoria continua.

La CDF se define como la suma desde -∞ a x de la variable aleatoria, para toda X ∈ Ω

Lo que nos indica esta distribución (variable aleatoria) es que tan probable es que nos salga una X que sea menor a x ∈ Ω
"""

using Plots, LaTeXStrings; plotlyjs()

f2(x) = (x < 0 ? x+1 : 1-x)*(abs(x)<1 ? 1 : 0)
a , b = -1.5, 1.5
delta  = 0.01

F(x) = sum([f2(u)*delta for u in a:delta:x])

xGrid = a:delta:b
y = [F(u) for u in xGrid]
plot(xGrid,y, c=:blue, xlims=(a,b),ylims = (0,1),xlabel =L"x",ylabel=L"F(x)",legend=:none)
