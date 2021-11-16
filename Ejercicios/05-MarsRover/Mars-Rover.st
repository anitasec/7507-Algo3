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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:09:15'!
test07

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'r'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:11:54'!
test08

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lr'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'N' equals: puntoCardinalActual ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:45:01'!
test09

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'rf'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual.
	self assert: (1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:46:14'!
test10

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lf'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual.
	self assert: (-1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:48:19'!
test11

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'llf'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'S' equals: puntoCardinalActual.
	self assert: (0@-1) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:51:38'!
test12

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'rb'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual.
	self assert: (-1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:54:38'!
test13

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'lb'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'O' equals: puntoCardinalActual.
	self assert: (1@0) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:55:59'!
test14

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'llb'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'S' equals: puntoCardinalActual.
	self assert: (0@1) equals: marsRover darPosicionActual.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 20:02:13'!
test15

	| marsRover puntoCardinalActual |
	
	marsRover := MarsRover new.
	
	marsRover recibirComandos: 'fffrff'.
	
	puntoCardinalActual := marsRover darPuntoCardinal.
	
	self assert: 'E' equals: puntoCardinalActual.
	self assert: (2@3) equals: marsRover darPosicionActual.! !


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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AS 11/16/2021 19:56:19'!
recibirComandos: sucesionDeComandos
	
	sucesionDeComandos do: [ :unComando |
		(unComando = $f) ifTrue: [ (puntoCardinalActual = 'N') ifTrue: [ posicionActual := posicionActual + (0@1)].
			(puntoCardinalActual = 'E') ifTrue: [posicionActual := posicionActual + (1@0)].
			(puntoCardinalActual = 'O') ifTrue: [posicionActual := posicionActual - (1@0)].
			(puntoCardinalActual = 'S') ifTrue: [posicionActual := posicionActual - (0@1)].
			].
		
		
		(unComando = $b) ifTrue: [ (puntoCardinalActual = 'N') ifTrue: [ posicionActual := posicionActual - (0@1)].
			(puntoCardinalActual = 'E') ifTrue: [posicionActual := posicionActual - (1@0)].
			(puntoCardinalActual = 'O') ifTrue: [posicionActual := posicionActual + (1@0)].
			(puntoCardinalActual = 'S') ifTrue: [posicionActual := posicionActual + (0@1)].
			].
		
		
		(unComando = $l) ifTrue: [ 
			(puntoCardinalActual = 'N') ifTrue:[puntoCardinalActual  := 'O']
			ifFalse:[ (puntoCardinalActual = 'O') ifTrue: [puntoCardinalActual := 'S'] 
			ifFalse:[(puntoCardinalActual = 'S') ifTrue: [puntoCardinalActual := 'E']
			ifFalse: [puntoCardinalActual := 'N']]]
			].
			
		(unComando = $r) ifTrue: [ 
			(puntoCardinalActual = 'N') ifTrue:[puntoCardinalActual  := 'E']
			ifFalse:[ (puntoCardinalActual = 'E') ifTrue: [puntoCardinalActual := 'S'] 
			ifFalse:[(puntoCardinalActual = 'S') ifTrue: [puntoCardinalActual := 'O']
			ifFalse: [puntoCardinalActual := 'N']]]
			]
		]! !
