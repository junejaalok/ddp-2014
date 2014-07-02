converter <- function(from,to,val) {
	if (from == "Celcius"){
		if (to == "Celcius") {
			val
		}
		else if (to == "Fahrenheit") {
			(val * 9/5) + 32
		}
		else if (to == "Kelvin") {
			val + 273
		}
	}	
} 


converter(Celcius,Fahrenheit,32)