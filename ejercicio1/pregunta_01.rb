def medallasdeOro(pais,medallasOro)
	
	mayor = medallasOro[0]
	ind = 0
	for i in 0..medallasOro.size-1

		if medallasOro[i] > mayor
			mayor = medallasOro[i]
			ind = i
		end
	end
		return pais [ind]

  #mayor = medallasOro.max 
  #ind = medallasOro.index(mayor)
  #return pais[ind]

end

def sumaMedallas(medallasOro, medallasPlata, medallasBronce)

  suma = Array.new
  for i in 0..medallasPlata.size-1
    suma[i] = medallasOro[i] + medallasPlata [i] + medallasBronce[i]
  end

  return suma
end

def encuentraGanador(pais,medallasOro,
                          medallasPlata,
                          medallasBronce)
  suma = Array.new
  suma = sumaMedallas(medallasOro, medallasPlata, medallasBronce)

  return medallasdeOro(pais, suma)

end

def debajoMedia(medallasOro,medallasPlata,medallasBronce)
	total=0
	todas=Array.new

  #primero encuentro el promedio
  suma = Array.new
  suma = sumaMedallas(medallasOro, medallasPlata, medallasBronce)

  sumaTotal = 0

  for i in 0..suma.size-1
    sumaTotal = sumaTotal + suma[i]
  end

  promedio = (sumaTotal / medallasOro.size).round(2)

 

  #contamos cuantos estan debajo del promedio

  cont =0
  for i in 0..suma.size-1
    if suma[i] < promedio
      cont = cont + 1
    end
  end

  

  #3


  #la respuesta es ese numero * 100 / numero paises , 
  # redondead a dos decimales
  respuesta = ((cont * 100.00) / medallasOro.size).round(2)
  

  return respuesta 

end


#--- zona de test ----

def test_medallasdeOro
	pais=["Colombia","Peru","Chile","Ecuador","Venezuela","Guatemala","Panama"]
	oro1=[23,45,34,12,5,33,44]
	oro2=[13,25,44,22,55,3,4]
	oro3=[63,45,34,12,5,33,55]
    print validate("Peru", medallasdeOro(pais,oro1)) 
    print validate("Venezuela", medallasdeOro(pais,oro2)) 
    print validate("Colombia", medallasdeOro(pais,oro3)) 
end

def test_encuentraGanador
  pais=["Colombia","Peru","Chile","Ecuador",
      "Venezuela","Guatemala","Panama"]
  oro1=[23,45,34,12,5,33,44]
  plata1=[13,25,44,22,55,3,4]
  broce1=[63,45,34,12,5,33,55]

  oro2=[33,34,3,22,25,31,41]
  plata2=[13,20,42,21,5,31,14]
  broce2=[14,42,36,44,45,22,77]
  oro3=[13,15,14,12,11,16,18]
  plata3=[43,55,64,72,55,88,48]
  broce3=[63,45,34,12,5,33,55]

  print validate("Peru", encuentraGanador(pais,oro1,plata1,broce1)) 
  print validate("Panama", encuentraGanador(pais,oro2,plata2,broce2)) 
  print validate("Guatemala", encuentraGanador(pais,oro3,plata3,broce3)) 
end

def test_debajoMedia
  oro1=[23,45,34,12,5,33,44]
  plata1=[13,25,44,22,55,3,4]
  broce1=[63,45,34,12,5,33,55]


  oro2=[33,34,3,22,25,31,41]
  plata2=[13,20,42,21,5,31,14]
  broce2=[14,42,36,44,45,22,77]
  oro3=[13,15,14,12,11,16,18]
  plata3=[43,55,64,72,55,88,48]
  broce3=[63,45,34,12,5,33,55]

  print validate(42.86, debajoMedia(oro1,plata1,broce1)) 
  print validate(57.14, debajoMedia(oro2,plata2,broce2)) 
  print validate(28.57, debajoMedia(oro3,plata3,broce3)) 
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_medallasdeOro
  #puts " "
  test_encuentraGanador
  #puts " "
  test_debajoMedia
  #puts " "
end
test