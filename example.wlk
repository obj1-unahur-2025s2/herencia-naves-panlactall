class Nave{
  var velocidad
  var direccion
  var property combustible
  method tienePocaActividad() 
  method estaDeRlajo()= self.estaTraquila() and self.tienePocaActividad()
  method escapar()
  method avisar()
  method recibirAmenaza() {
    self.escapar()
    self.avisar()
  }
  method estaTraquila()
  method condicionesParaLaTranquilidad() {
    return combustible >= 4000 and velocidad <= 1200 and direccion
  } 
  method accionAdicional(){
    self.cargarCombustible(5000)
    self.acelerar(10000)
  } 
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
  method cargarCombustible(cantidad) {
    combustible += cantidad
  }
  method descargarCombustible(cantidad) {
    combustible -= cantidad
  }
}
class NaveBaliza inherits Nave{
  var color
  var cambioDeColor= false
method cambiarColorBaliza(nuevoColor) {
  color=nuevoColor
  cambioDeColor= true
  }
  method color() = color
  override method prepararViaje() {
    self.accionAdicional()
    self.cambiarColorBaliza("verde")
    self.ponerseParaleloAlSol()
  }
  override method estaTraquila() = self.condicionesParaLaTranquilidad() and (self.color()!="rojo")
  override method tienePocaActividad() = not cambioDeColor
}
class NaveDePasajeros inherits Nave{
  var cantidadDePasajeros
  var property comida
  var property bebida   
  override method prepararViaje() {
    self.accionAdicional()
    self.comida(self.comida()+(cantidadDePasajeros*4))
    self.bebida(self.bebida()+(cantidadDePasajeros*6))
    self.acercarseUnPocoAlSol()
  }
   override method estaTraquila() = self.condicionesParaLaTranquilidad()
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
  self.accionAdicional()
  self.ponerseVisible()
  self.misilesDesplegar()
  self.acelerar(15000)
  self.emitioMensaje("Saliendo en mision")
  }
   override method estaTraquila() = self.condicionesParaLaTranquilidad()
   override method tienePocaActividad() = true
}
class NaveHospital inherits NaveDePasajeros{
  var quirofanosPreparados = false
  method prepararQuirofanos() {
    quirofanosPreparados = true
  }
  method quirofanosPreparados() = quirofanosPreparados
  method usarQuirofanos() {
    quirofanosPreparados = false
  }
   override method estaTraquila() = self.condicionesParaLaTranquilidad()
}

class NaveSigilosa inherits NaveDeCombate{
  override method estaTraquila() = super() and (not self.estaInvisile())
}