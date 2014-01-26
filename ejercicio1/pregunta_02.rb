
def alumnosRiesgo(promedios)
	cont =0
  for i in 0..promedios.size-1
    if promedios[i] < 10
      cont = cont + 1
    end
  end
  respuesta = ((cont * 100.00)/promedios.size).round(2)
  return respuesta

end

def mejorAumno(nombres,apellidos,notas)
	 
   mayor = notas[0]
  ind = 0
  for i in 0..notas.size-1

    if notas[i] > mayor
      mayor = notas[i]
      ind = i
    end
  end
    return nombres [ind] + ' ' + apellidos [ind]



end

def mejorCarrera(vector)
	#vector1=["ING 10.23","ING 15.10","ADM 11.13","ADM 15.11","MED 12.14","MED 15.34","NEG 18.23","NEG 15.12"]

  mayor = vector[0][4..8]
  ind =0
  for i in 0..vector.size-1
    
    if vector[i][4..8]> mayor
      mayor = vector[i][4..8]
      ind = i
    end

  end

  return  vector[ind][0..2]

end


#--- zona de test ----

def test_alumnosRiesgo
	promedios1=[12.10,8.5,15.2,11.85,6.8,5.6,16.5,18.6,14.9]
	promedios2=[14.10,18.5,16.2,10.85,16.8,15.6,6.5,8.6,13.5]
	promedios3=[10.10,16.5,10.2,12.85,16.8,9.1,14.5,17.2,17.9]
    print validate(33.33, alumnosRiesgo(promedios1)) 
    print validate(22.22, alumnosRiesgo(promedios2)) 
    print validate(11.11, alumnosRiesgo(promedios3)) 
end

def test_mejorAlumno
	nombres1=["Jose","Isabel","Elisa","Pedro","Juan","Luisa","Ines","Victor","Hugo"]
	apellidos1=["Claros","Rengifo","Pino","Calle","Perez","Villa","Garcia","Lee","Boss"]
	notas1=[12.10,8.5,15.2,11.85,6.8,5.6,16.5,18.6,14.9]
	
  nombres2=["Alfredo","Omayra","Raul","Edison","Oscar","Luis","Paulo","Carlos","Paul"]
	apellidos2=["Luyo","Perez","Pinto","Callejon","Perez-Calvo","Vilchez","Garzon","Lopez","Bueno"]
	notas2=[16.10,18.5,15.2,11.85,19.8,15.6,15.5,18.16,15.9]	
    print validate("Victor Lee", mejorAumno(nombres1,apellidos1,notas1)) 
    print validate("Oscar Perez-Calvo", mejorAumno(nombres2,apellidos2,notas2)) 
end

def test_mejorCarrera
	vector1=["ING 10.23","ING 15.10","ADM 11.13","ADM 15.11","MED 12.14","MED 15.34","NEG 18.23","NEG 15.12"]
	vector2=["ING 18.23","ING 14.21","ADM 12.21","ADM 18.23","MED 11.14","MED 12.14","NEG 17.20","NEG 17.22"]	
    print validate("NEG", mejorCarrera(vector1)) 
    print validate("ING", mejorCarrera(vector2)) 
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_alumnosRiesgo
  puts " "
  test_mejorAlumno
  puts " "  
  test_mejorCarrera  
  puts " "    
end
test