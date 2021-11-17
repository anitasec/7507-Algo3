!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/16/2021 20:22:56'!
test01ElMarsRoverNoRecibeComandosYSeQuedaEnSuLugar

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: ''.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@0) equals: posicionActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/16/2021 20:28:18'!
test02ElMarsRoverRecibeElComandoDeAvanzarYSeMueveHaciaAdelante

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'f'.
	
	posicionActual := marsRover darPosicionActual.
	self assert:  (0@1) equals: posicionActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/16/2021 20:29:03'!
test03ElMarsRoverRecibeElComandoDeRetrocederYSeMueveHaciaAtras

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'b'.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@-1) equals: posicionActual 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/16/2021 20:30:11'!
test04ElMarsRoverRecibeElComandoDeAvanzarYRetrocederJuntosYTerminaEnElPuntoInicial

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'fb'.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@0) equals: posicionActual 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:35'!
test05ElMarsRoverNoRecibeComandosYSigueApuntandoHaciaElNorte

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: ''.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'N' equals: puntoCardinalActual! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test06ElMarsRoverRecibeElComandoDeRotar90GradosALaIzquierdaYAhoraApuntaAlOeste

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'l'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:35'!
test07ElMarsRoverRecibeElComandoDeRotar90GradosALaDerechaYAhoraApuntaAlEste

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'r'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test08ElMarsRoverRotaHaciaLaIzquiedaYALaDerechaYVuelveAApuntarHaciaElNorte

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lr'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'N' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test09ElMarsRoverAvanzaHaciaElEsteCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'rf'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual.
	self assert: (1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test10ElMarsRoverAvanzaHaciaElOesteCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lf'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual.
	self assert: (-1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test11ElMarsRoverAvanzaHaciaElSurCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'llf'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'S' equals: puntoCardinalActual.
	self assert: (0@-1) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test12ElMarsRoverRetrocedeViendoHaciaElEsteCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'rb'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual.
	self assert: (-1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
test13ElMarsRoverRetrocedeViendoHaciaElOesteCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lb'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual.
	self assert: (1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:35'!
test14ElMarsRoverRetrocedeViendoHaciaElSurCorrectamente

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'llb'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'S' equals: puntoCardinalActual.
	self assert: (0@1) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:29:52'!
test15ElMarsRoverRecibeUnComandoErroneo
	
	| marsRover |
	
	marsRover := MarsRover new.
	
	self
		should: [ marsRover recibirComandos: 'ffxf'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover comandoNoSoportadoError]
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:29:02'!
test999
	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'ffffll'.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: 'S' equals: puntoCardinalActual.
	self assert: (0@4) equals: marsRover darPosicionActual.! !


!classDefinition: #Comando category: 'Mars-Rover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Comando methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:31:22'!
hacerActuarAlMarsRover: unMarsRover
	
	^self subclassResponsibility ! !


!classDefinition: #Avance category: 'Mars-Rover'!
Comando subclass: #Avance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Avance methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover
	
	unMarsRover avanzar! !


!classDefinition: #GiroALaDerecha category: 'Mars-Rover'!
Comando subclass: #GiroALaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!GiroALaDerecha methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover girarALaDerecha ! !


!classDefinition: #GiroALaIzquierda category: 'Mars-Rover'!
Comando subclass: #GiroALaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!GiroALaIzquierda methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover girarALaIzquierda ! !


!classDefinition: #Retroceso category: 'Mars-Rover'!
Comando subclass: #Retroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Retroceso methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover retroceder ! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual puntoCardinalActual comandosConocidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:02:14'!
avanzar

	posicionActual := puntoCardinalActual avanzarDesdeLaPosicion: posicionActual ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:21:04'!
darPosicionActual

	^posicionActual ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:35'!
darRepresentacionDePuntoCardinal
	^puntoCardinalActual darRepresentacionDePuntoCardinal! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:48:39'!
girarALaDerecha
	
	puntoCardinalActual := puntoCardinalActual girarALaDerecha.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:49:13'!
girarALaIzquierda

	puntoCardinalActual := puntoCardinalActual girarALaIzquierda ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:21:43'!
initialize
	
	posicionActual := (0@0).
	puntoCardinalActual := Norte new.
	comandosConocidos := Dictionary new.
	comandosConocidos at: $f put: Avance new; at: $b put: Retroceso new; at: $l put: GiroALaIzquierda new; at: $r put: GiroALaDerecha new! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:30:51'!
recibirComandos: sucesionDeComandos
	
	sucesionDeComandos do: [ :unComando |
		self validarComando: unComando.
		
		(comandosConocidos at: unComando) hacerActuarAlMarsRover: self.
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:04:45'!
retroceder

	posicionActual := puntoCardinalActual retrocederDesdeLaPosicion: posicionActual ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:25:09'!
validarComando: unComando
	comandosConocidos at: unComando ifAbsent: [^self error: MarsRover comandoNoSoportadoError ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:23:35'!
comandoNoSoportadoError

	^'comando no soportado'! !


!classDefinition: #PuntoCardinal category: 'Mars-Rover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:01:39'!
avanzarDesdeLaPosicion: unaPosicion
	
	^self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:31:59'!
darRepresentacionDePuntoCardinal

	^self subclassResponsibility ! !


!classDefinition: #Este category: 'Mars-Rover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Este methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:59:38'!
avanzarDesdeLaPosicion: unaPosicion

	^unaPosicion + (1@0)! !

!Este methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
darRepresentacionDePuntoCardinal
	^'E'! !

!Este methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:46:46'!
girarALaDerecha
	^Sur new! !

!Este methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:46:55'!
girarALaIzquierda
	^Norte new! !

!Este methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:03:43'!
retrocederDesdeLaPosicion: unaPosicion
	
	^unaPosicion - (1@0)! !


!classDefinition: #Norte category: 'Mars-Rover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:58:54'!
avanzarDesdeLaPosicion: unaPosicion

	^unaPosicion + (0@1)! !

!Norte methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
darRepresentacionDePuntoCardinal
	^'N'! !

!Norte methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:46:15'!
girarALaDerecha
	^Este new! !

!Norte methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:46:36'!
girarALaIzquierda
	^Oeste new! !

!Norte methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:03:28'!
retrocederDesdeLaPosicion: unaPosicion
	
	^unaPosicion - (0@1)! !


!classDefinition: #Oeste category: 'Mars-Rover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:00:24'!
avanzarDesdeLaPosicion: unaPosicion

	^unaPosicion - (1@0)! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
darRepresentacionDePuntoCardinal
	^'O'! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:47:11'!
girarALaDerecha
	^Norte new! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:47:21'!
girarALaIzquierda
	^Sur new! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:03:57'!
retrocederDesdeLaPosicion: unaPosicion
	
	^unaPosicion + (1@0)! !


!classDefinition: #Sur category: 'Mars-Rover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:00:46'!
avanzarDesdeLaPosicion: unaPosicion

	^unaPosicion - (0@1)! !

!Sur methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:56:34'!
darRepresentacionDePuntoCardinal
	^'S'! !

!Sur methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:47:35'!
girarALaDerecha
	^Oeste new! !

!Sur methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 19:47:44'!
girarALaIzquierda
	^Este new! !

!Sur methodsFor: 'as yet unclassified' stamp: 'AG 11/17/2021 20:04:12'!
retrocederDesdeLaPosicion: unaPosicion
	
	^unaPosicion + (0@1)! !
