class Nave{
  var velocidad
  var direccion
  method prepararViaje()
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
class NaveBaliza inherits Nave{
  var color
method cambiarColorBaliza(nuevoColor) {
  color=nuevoColor
  }
  method color() = color
  override method prepararViaje() {
    self.cambiarColorBaliza("verde")
    self.ponerseParaleloAlSol()
  }
}
class NaveDePasajeros inherits Nave{
  var cantidadDePasajeros
  var property comida
  var property bebida   
  override method prepararViaje() {
    self.comida(self.comida()+(cantidadDePasajeros*4))
    self.bebida(self.bebida()+(cantidadDePasajeros*6))
    self.acercarseUnPocoAlSol()
  }
}
class NaveDeCombate inherits Nave{
  var misilesDesplegados = true
  var invisible
  const mensajes=[]
  method ponerseVisible() {
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
  method esCueta () = mensajes.all({p=> p.length()}<30)
  method emitioMensaje(unMensaje) = mensajes.contains({p=>p.contains(unMensaje)})  

  override method prepararViaje() {
  self.ponerseVisible()
  self.misilesDesplegar()
  self.acelerar(15000)
  self.emitioMensaje("Saliendo en mision")
  }
}
