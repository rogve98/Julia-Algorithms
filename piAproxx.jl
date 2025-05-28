using LinearAlgebra
using Random
using Plots
plotlyjs()

"""
Usango números pseudoaleatorios se determina una aproximación del número π determinando cuantos puntos cumplen el área del círculo x^2 + y^2 <= 1 dividido entre 4, es decir, fijándonos en el segmento superior derecho. La aproximación solamente logra los primeros dos decimales de forma correcta (pero algo es algo).
"""

N = 1e5
data = [[rand(),rand()] for _ in 1:N]
indata = filter(x -> (norm(x) <= 1),data)
outdata = filter(x -> (norm(x) > 1),data)
piAprox = 4*length(indata)/N
println("Estimación de π ", piAprox)

scatter(first.(indata),last.(indata),c=:blue,ms=1,msw=0)
scatter!(first.(outdata),last.(outdata),c=:red,ms=1,msw=0,
         legend=:none,
         ratio=:equal,
         xlims=(0,1),
         ylims=(0,1)
        )
