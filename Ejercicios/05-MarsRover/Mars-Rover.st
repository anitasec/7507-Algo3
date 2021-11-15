!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:34:32'!
test01

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: ''.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@0) equals: posicionActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:34:14'!
test02

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'f'.
	
	posicionActual := marsRover darPosicionActual.
	self assert:  (0@1) equals: posicionActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:34:45'!
test03

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'b'.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@-1) equals: posicionActual 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:35:00'!
test04

	| marsRover posicionActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'fb'.
	
	posicionActual := marsRover darPosicionActual.
	self assert: (0@0) equals: posicionActual 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:56:50'!
test05

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: ''.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'N' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:57:15'!
test06

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'l'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual ! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual puntoCardinalActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:21:04'!
darPosicionActual

	^posicionActual ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 14:03:29'!
darPuntoCardinal
	^puntoCardinalActual ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 13:59:06'!
initialize
	
	posicionActual := (0@0).
	puntoCardinalActual := 'N'! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AG 11/15/2021 14:03:49'!
recibirComandos: sucesionDeComandos
	
	sucesionDeComandos do: [ :unComando |
		(unComando = $f) ifTrue: [ posicionActual := posicionActual + (0@1)].
		(unComando = $b) ifTrue: [ posicionActual := posicionActual - (0@1)].
		(unComando = $l) ifTrue: [ puntoCardinalActual := 'O'].
		].! !
