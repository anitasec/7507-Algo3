!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'assertions' stamp: 'AS 11/18/2021 13:53:37'!
acertarQueAlRecibirComandos: unosComandos elMarsRoverApuntaHaciaElPuntoCardinal: unaRepresentacionDePuntoCardinal

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: unosComandos.
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: unaRepresentacionDePuntoCardinal equals: puntoCardinalActual
	! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'AS 11/18/2021 13:50:08'!
acertarQueAlRecibirComandos: unosComandos elMarsRoverQuedaEnLaPosicion: unaPosicionDelPlano
	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: unosComandos.
	
	posicionActual := marsRover darPosicionActual.
	self assert: unaPosicionDelPlano equals: posicionActual 
	! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'AS 11/18/2021 13:59:07'!
acertarQueAlRecibirComandos: unosComandos elMarsRoverQuedaEnLaPosicion: unaPosicion yApuntaAlPuntoCardinal: unaRespresentacionDePuntoCardinal

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: unosComandos .
	
	puntoCardinalActual := marsRover darRepresentacionDePuntoCardinal.
	
	self assert: unaRespresentacionDePuntoCardinal equals: puntoCardinalActual.
	self assert: unaPosicion equals: marsRover darPosicionActual.! !


!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:50:39'!
test01ElMarsRoverNoRecibeComandosYSeQuedaEnSuLugar

	self acertarQueAlRecibirComandos: '' elMarsRoverQuedaEnLaPosicion: (0@0) ! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:51:06'!
test02ElMarsRoverRecibeElComandoDeAvanzarYSeMueveHaciaAdelante

	self acertarQueAlRecibirComandos: 'f' elMarsRoverQuedaEnLaPosicion: (0@1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:51:38'!
test03ElMarsRoverRecibeElComandoDeRetrocederYSeMueveHaciaAtras

	self acertarQueAlRecibirComandos: 'b' elMarsRoverQuedaEnLaPosicion: (0@-1)
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:51:53'!
test04ElMarsRoverRecibeElComandoDeAvanzarYRetrocederJuntosYTerminaEnElPuntoInicial

	self acertarQueAlRecibirComandos: 'fb' elMarsRoverQuedaEnLaPosicion: (0@0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:54:10'!
test05ElMarsRoverNoRecibeComandosYSigueApuntandoHaciaElNorte

	self acertarQueAlRecibirComandos: '' elMarsRoverApuntaHaciaElPuntoCardinal: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:54:32'!
test06ElMarsRoverRecibeElComandoDeRotar90GradosALaIzquierdaYAhoraApuntaAlOeste
	
	self acertarQueAlRecibirComandos: 'l' elMarsRoverApuntaHaciaElPuntoCardinal: 'O'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:54:47'!
test07ElMarsRoverRecibeElComandoDeRotar90GradosALaDerechaYAhoraApuntaAlEste

	self acertarQueAlRecibirComandos: 'r' elMarsRoverApuntaHaciaElPuntoCardinal: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:55:01'!
test08ElMarsRoverRotaHaciaLaIzquiedaYALaDerechaYVuelveAApuntarHaciaElNorte

	self acertarQueAlRecibirComandos: 'lr' elMarsRoverApuntaHaciaElPuntoCardinal: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 13:59:32'!
test09ElMarsRoverAvanzaHaciaElEsteCorrectamente
	
	self acertarQueAlRecibirComandos: 'rf' elMarsRoverQuedaEnLaPosicion: (1@0)  yApuntaAlPuntoCardinal: 'E'
! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:00:04'!
test10ElMarsRoverAvanzaHaciaElOesteCorrectamente

	self acertarQueAlRecibirComandos: 'lf' elMarsRoverQuedaEnLaPosicion: (-1@0)  yApuntaAlPuntoCardinal: 'O'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:00:21'!
test11ElMarsRoverAvanzaHaciaElSurCorrectamente

	self acertarQueAlRecibirComandos: 'llf' elMarsRoverQuedaEnLaPosicion: (0@-1)  yApuntaAlPuntoCardinal: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:00:35'!
test12ElMarsRoverRetrocedeViendoHaciaElEsteCorrectamente

	self acertarQueAlRecibirComandos: 'rb' elMarsRoverQuedaEnLaPosicion: (-1@0)  yApuntaAlPuntoCardinal: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:00:52'!
test13ElMarsRoverRetrocedeViendoHaciaElOesteCorrectamente

	self acertarQueAlRecibirComandos: 'lb' elMarsRoverQuedaEnLaPosicion: (1@0)  yApuntaAlPuntoCardinal: 'O'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:01:10'!
test14ElMarsRoverRetrocedeViendoHaciaElSurCorrectamente

	self acertarQueAlRecibirComandos: 'llb' elMarsRoverQuedaEnLaPosicion: (0@1)  yApuntaAlPuntoCardinal: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'AS 11/18/2021 14:01:31'!
test15ElMarsRoverRecibeUnComandoErroneo
	
	| marsRover |
	
	marsRover := MarsRover new.
	
	self
		should: [ MarsRover new recibirComandos: 'ffxf'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover comandoNoSoportadoError]
! !


!classDefinition: #Comando category: 'Mars-Rover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Comando methodsFor: 'indicaciones' stamp: 'AG 11/17/2021 20:31:22'!
hacerActuarAlMarsRover: unMarsRover
	
	^self subclassResponsibility ! !


!classDefinition: #Avance category: 'Mars-Rover'!
Comando subclass: #Avance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Avance methodsFor: 'indicaciones' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover
	
	unMarsRover avanzar! !


!classDefinition: #GiroALaDerecha category: 'Mars-Rover'!
Comando subclass: #GiroALaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!GiroALaDerecha methodsFor: 'indicaciones' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover girarALaDerecha ! !


!classDefinition: #GiroALaIzquierda category: 'Mars-Rover'!
Comando subclass: #GiroALaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!GiroALaIzquierda methodsFor: 'indicaciones' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover girarALaIzquierda ! !


!classDefinition: #Retroceso category: 'Mars-Rover'!
Comando subclass: #Retroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Retroceso methodsFor: 'indicaciones' stamp: 'AG 11/17/2021 20:30:50'!
hacerActuarAlMarsRover: unMarsRover

	unMarsRover retroceder ! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual puntoCardinalActual comandosConocidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'AG 11/17/2021 20:21:43'!
initialize
	
	posicionActual := (0@0).
	puntoCardinalActual := Norte new.
	comandosConocidos := Dictionary new.
	comandosConocidos at: $f put: Avance new; at: $b put: Retroceso new; at: $l put: GiroALaIzquierda new; at: $r put: GiroALaDerecha new! !


!MarsRover methodsFor: 'auxiliares - privado' stamp: 'AG 11/17/2021 20:25:09'!
validarComando: unComando
	comandosConocidos at: unComando ifAbsent: [^self error: MarsRover comandoNoSoportadoError ].! !


!MarsRover methodsFor: 'testing' stamp: 'AG 11/15/2021 13:21:04'!
darPosicionActual

	^posicionActual ! !

!MarsRover methodsFor: 'testing' stamp: 'AS 11/18/2021 13:42:22'!
darRepresentacionDePuntoCardinal

	^puntoCardinalActual darRepresentacionDePuntoCardinal! !


!MarsRover methodsFor: 'acciones' stamp: 'AG 11/17/2021 20:02:14'!
avanzar

	posicionActual := puntoCardinalActual avanzarDesdeLaPosicion: posicionActual ! !

!MarsRover methodsFor: 'acciones' stamp: 'AG 11/17/2021 19:48:39'!
girarALaDerecha
	
	puntoCardinalActual := puntoCardinalActual girarALaDerecha.! !

!MarsRover methodsFor: 'acciones' stamp: 'AG 11/17/2021 19:49:13'!
girarALaIzquierda

	puntoCardinalActual := puntoCardinalActual girarALaIzquierda ! !

!MarsRover methodsFor: 'acciones' stamp: 'AG 11/17/2021 20:30:51'!
recibirComandos: sucesionDeComandos
	
	sucesionDeComandos do: [ :unComando |
		self validarComando: unComando.
		
		(comandosConocidos at: unComando) hacerActuarAlMarsRover: self.
		]! !

!MarsRover methodsFor: 'acciones' stamp: 'AG 11/17/2021 20:04:45'!
retroceder

	posicionActual := puntoCardinalActual retrocederDesdeLaPosicion: posicionActual ! !

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

!PuntoCardinal methodsFor: 'testing' stamp: 'AG 11/17/2021 20:31:59'!
darRepresentacionDePuntoCardinal

	^self subclassResponsibility ! !


!PuntoCardinal methodsFor: 'acciones' stamp: 'AG 11/17/2021 20:01:39'!
avanzarDesdeLaPosicion: unaPosicion
	
	^self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'acciones' stamp: 'AS 11/18/2021 13:43:17'!
girarALaDerecha

	^self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'acciones' stamp: 'AS 11/18/2021 13:43:21'!
girarALaIzquierda

	^self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'acciones' stamp: 'AS 11/18/2021 13:39:58'!
retrocederDesdeLaPosicion: unaPosicion
	
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

!Este methodsFor: 'as yet unclassified' stamp: 'AS 11/18/2021 14:02:33'!
darRepresentacionDePuntoCardinal

	^'E'! !

!Este methodsFor: 'as yet unclassified' stamp: 'AS 11/18/2021 14:02:37'!
girarALaDerecha

	^Sur new! !

!Este methodsFor: 'as yet unclassified' stamp: 'AS 11/18/2021 14:02:39'!
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
