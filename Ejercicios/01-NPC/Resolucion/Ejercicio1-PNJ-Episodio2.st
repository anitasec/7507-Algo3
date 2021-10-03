!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'interaccionesPorPersonaje frasesParaDesconocidos frasesParaPrometedores'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AS 10/1/2021 22:19:50'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^self responderSegunCantidadDeInteraccionesCon: unPersonaje! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AS 10/1/2021 22:20:09'!
olvidar
	interaccionesPorPersonaje := Dictionary new! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AS 10/1/2021 22:51:33'!
olvidarInteraccionesCon: unPersonaje
	interaccionesPorPersonaje at: unPersonaje put: 0! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones-privado' stamp: 'AG 10/3/2021 18:46:26'!
recordarInteraccionCon: unPersonaje
	interaccionesPorPersonaje at: unPersonaje put: ((self buscarNumeroDeInteraccionDe: unPersonaje) + 1)! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones-privado' stamp: 'AG 10/3/2021 19:17:02'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	^self buscarInteraccionCon: (self buscarNumeroDeInteraccionDe: unPersonaje) Para: unPersonaje
	
	! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:43:46'!
buscarFraseParaDesconocidoCon: unNumeroDeInteraccion
	^ frasesParaDesconocidos at: (unNumeroDeInteraccion min: frasesParaDesconocidos size)
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:44:01'!
buscarFraseParaPrometedorCon: unNumeroDeInteraccion
	^ frasesParaPrometedores at: (unNumeroDeInteraccion min: frasesParaPrometedores size)
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 19:16:23'!
buscarInteraccionCon: unNumeroDeInteraccion Para: unPersonaje
	(OpinionDelPueblo esPrometedor: unPersonaje) ifTrue: 
	[^ self buscarFraseParaPrometedorCon: unNumeroDeInteraccion ].
	(unNumeroDeInteraccion = frasesParaDesconocidos size) ifTrue: [
		OpinionDelPueblo hacerPrometedorA: unPersonaje.].
	^ self buscarFraseParaDesconocidoCon: unNumeroDeInteraccion ! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:44:23'!
buscarNumeroDeInteraccionDe: unPersonaje
	^interaccionesPorPersonaje at: unPersonaje ifAbsent: [0].! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'AG 10/3/2021 19:27:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interaccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->0); yourself).
	frasesParaDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesParaPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).! !


!classDefinition: #HabitantesDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #HabitantesDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitantesDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
HabitantesDeRiverwood class
	instanceVariableNames: 'NPCsDelPueblo'!

!HabitantesDeRiverwood class methodsFor: 'reinicio' stamp: 'AG 10/3/2021 19:10:42'!
reiniciarInteraccionCon: unPersonaje
	NPCsDelPueblo do: [ :NPC | NPC olvidarInteraccionesCon: unPersonaje ]
	! !


!HabitantesDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'AG 10/3/2021 19:27:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	NPCsDelPueblo := ((OrderedCollection new) add: CarolinaLaCuranderaDeRiverwood; add: TreborElGuardiaDeSkyrim; yourself).! !


!classDefinition: #OpinionDelPueblo category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #OpinionDelPueblo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OpinionDelPueblo class' category: 'Ejercicio1-PNJ-Episodio2'!
OpinionDelPueblo class
	instanceVariableNames: 'personajesPrometedores'!

!OpinionDelPueblo class methodsFor: 'consulta' stamp: 'AG 9/29/2021 21:51:31'!
esPrometedor: unPersonaje
	^personajesPrometedores includes: unPersonaje! !


!OpinionDelPueblo class methodsFor: 'interacciones' stamp: 'AG 10/3/2021 19:06:24'!
hacerPrometedorA: unPersonaje
	personajesPrometedores add: unPersonaje.
	HabitantesDeRiverwood reiniciarInteraccionCon: unPersonaje! !

!OpinionDelPueblo class methodsFor: 'interacciones' stamp: 'AG 9/29/2021 21:40:00'!
olvidar
	personajesPrometedores := OrderedCollection new! !


!OpinionDelPueblo class methodsFor: 'as yet unclassified' stamp: 'AG 10/3/2021 19:27:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	personajesPrometedores := ((OrderedCollection new) add: #Hamilton; yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AS 10/1/2021 22:27:37'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AG 10/3/2021 18:04:05'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AG 10/3/2021 18:05:14'!
tirion
	^#Tirion ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:36:10'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^OpinionDelPueblo esPrometedor: unPersonaje! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:26:29'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeRiverwood olvidar.
	
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:34:15'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	OpinionDelPueblo olvidar! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:34:15'!
hacerQueRiverwoodVeaPrometedorAHamilton
	OpinionDelPueblo hacerPrometedorA: self hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'AS 9/27/2021 21:34:05'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'AG 10/3/2021 18:04:21'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'AG 10/3/2021 18:05:19'!
tirion
	^#Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:34:15'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	OpinionDelPueblo olvidar! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AS 10/1/2021 22:34:15'!
hacerQueRiverwoodVeaPrometedorAHamilton
	OpinionDelPueblo hacerPrometedorA: self hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'interaccionesPorPersonaje frasesParaDesconocidos frasesParaPrometedores'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AG 9/29/2021 21:16:48'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^self responderSegunCantidadDeInteraccionesCon: unPersonaje

	
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AG 9/29/2021 21:13:57'!
olvidar
	interaccionesPorPersonaje := Dictionary new! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AS 10/1/2021 22:51:15'!
olvidarInteraccionesCon: unPersonaje
	interaccionesPorPersonaje at: unPersonaje put: 0! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'AG 10/3/2021 18:12:55'!
recordarInteraccionCon: unPersonaje
	interaccionesPorPersonaje at: unPersonaje put: ((self buscarNumeroDeInteraccionDe: unPersonaje) + 1)

! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'AG 10/3/2021 19:16:23'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	^self buscarInteraccionCon: (self buscarNumeroDeInteraccionDe: unPersonaje) Para: unPersonaje ! !


!TreborElGuardiaDeSkyrim class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:42:06'!
buscarFraseParaDesconocidoCon: unNumeroDeInteraccion
	^ frasesParaDesconocidos at: (unNumeroDeInteraccion min: frasesParaDesconocidos size)
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:43:20'!
buscarFraseParaPrometedorCon: unNumeroDeInteraccion
	^ frasesParaPrometedores at: (unNumeroDeInteraccion min: frasesParaPrometedores size)
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 19:16:23'!
buscarInteraccionCon: unNumeroDeInteraccion Para: unPersonaje
	(OpinionDelPueblo esPrometedor: unPersonaje) ifTrue: 
	[^ self buscarFraseParaPrometedorCon: unNumeroDeInteraccion ].
	^ self buscarFraseParaDesconocidoCon: unNumeroDeInteraccion ! !

!TreborElGuardiaDeSkyrim class methodsFor: 'buscadores' stamp: 'AG 10/3/2021 18:30:27'!
buscarNumeroDeInteraccionDe: unPersonaje
	^interaccionesPorPersonaje at: unPersonaje ifAbsent: [0].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'AG 10/3/2021 19:27:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interaccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->2); yourself).
	frasesParaDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
HabitantesDeRiverwood initializeAfterFileIn!
OpinionDelPueblo initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!