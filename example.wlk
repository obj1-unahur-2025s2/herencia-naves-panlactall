class Nave{
  var velocidad
  var direccion
  method acelerar(cuanto){
    velocidad = (velocidad + cuanto.min(100000))
  }
  method desacelerar(cuanto){
    velocidad = (velocidad - cuanto.max(0))
  }
  method irHaciaElSol() { direccion=10
  } 
  method escaparDelSol() { direccion=-10
  }
  method ponerseParaleloAlSol() { direccion=0
  }
  method acercarseUnPocoAlSol() {
    direccion=(direccion + 1).min(10)
  }
  method alejarseUnPocoAlSol() {
    direccion=( direccion- 1).max(-10)
  }
}
class naveBaliza inherits Nave{
  var color
method cambiarColorBaliza(nuevoColor) {
  color=nuevoColor
  }
  method color() = color
}
class NaveDePasajeros{
  var cantidadDePasajeros
  var property comida
  var property bebida   
}
class NaveDeCombate inherits Nave{
  var misilesDesplegados = true
  var invisible
  const mensajes=[]
  method ponerVisible() {
    invisible= false
  }
  method ponerInvisible() {
    invisible= true
  }
  method estaInvisile()= invisible
  method misilesDesplegar() {
    misilesDesplegados= false
  }
  method misilesDesplegados() = misilesDesplegados 
  method emitirMensaje(mensaje) {mensajes.add(mensaje)}
  method mensajesEmitidos() = mensajes
  method primerMensajeEmitido() = mensajes.first()
  method ultimoMensajeEEmitido() = mensajes.last()
  method esCueta () = mensajes.length({p=> p.length()}<30)
  method emitioMensaje(unMensaje) = mensajes.contains({p=>p.contains(unMensaje)})  
}
