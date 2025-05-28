using StatsBase, Plots; plotlyjs()

names = ["Mary", "Mel", "David", "Jhon", "Kayley", "Anderson"]
randomNames() = rand(names)
X = 3:8
N = 1e6
sampleLengths = [length(randomNames()) for _ in 1:N]

bar(X,counts(sampleLengths)/N, ylims=(0,0.35),
    xlabel="Name length", 
    ylabel="Estimated p(x)", 
    legend=:none
   )
