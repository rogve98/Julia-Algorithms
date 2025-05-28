using Random 
Random.seed!()

"Probabilidad e intentos para poder acertar en una contraseña que tiene 62 caracteres alfanuméricos"

passLength, numMatchesForLog = 8, 1
possibleChars = ['a':'z'; 'A':'Z'; '0':'9']

correctPassw = "3xyZu7vN"
numMatch(loginPassw) = sum([loginPassw[i] == correctPassw[i] for i in 1:passLength])

N = 1e7

passwords = [String(rand(possibleChars,passLength)) for _ in 1:N]
numLogs = sum([numMatch(p) >= numMatchesForLog for p in passwords])
println("Número de intentos de inicio de sesión registrados: ",numLogs)
println("Proporción de intentos de inicio de sesión registrados: ",numLogs/N)

                            
                            
