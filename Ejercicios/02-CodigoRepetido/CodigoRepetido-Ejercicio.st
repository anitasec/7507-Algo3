!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'auxiliares' stamp: 'AS 10/11/2021 17:44:12'!
calcularLaDiferenciaDeTiempoCon: unBloque
	"comment stating purpose of message"

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	unBloque value.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning
	! !


!CustomerBookTest methodsFor: 'tests' stamp: 'AS 10/11/2021 17:47:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook diferenciaDeTiempo |
	
	customerBook := CustomerBook new.
	
	diferenciaDeTiempo := self calcularLaDiferenciaDeTiempoCon: [customerBook addCustomerNamed: 'John Lennon'].

	self assert: diferenciaDeTiempo < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AS 10/11/2021 17:49:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney diferenciaDeTiempo |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	diferenciaDeTiempo := self calcularLaDiferenciaDeTiempoCon: 	[customerBook removeCustomerNamed: paulMcCartney].
	
	self assert: diferenciaDeTiempo < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:14:16'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self verificarClienteNoVacioConBloque:  [customerBook addCustomerNamed: ''] para: customerBook.
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:30:34'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarParaUnUnicoClienteCon: [customerBook removeCustomerNamed: 'Paul McCartney'.] conError: NotFound con: customerBook para: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:32:58'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verificarCantidadDeClientesActivosCon: 0 CantidadDeClientesSuspendidosCon: 1 CantidadTotalDeClientes: 1 Para: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:32:58'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verificarCantidadDeClientesActivosCon: 0 CantidadDeClientesSuspendidosCon: 0 CantidadTotalDeClientes: 0 Para: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:30:34'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarParaUnUnicoClienteCon: [customerBook suspendCustomerNamed: 'Ringo Starr'.] conError: CantSuspend con: customerBook para: johnLennon.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AG 10/13/2021 18:30:34'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self verificarParaUnUnicoClienteCon: [customerBook suspendCustomerNamed: johnLennon .] conError: CantSuspend con: customerBook para: johnLennon.
! !


!CustomerBookTest methodsFor: 'auxiliares - assertion' stamp: 'AG 10/13/2021 18:32:58'!
verificarCantidadDeClientesActivosCon: unaCantidadDeActivos CantidadDeClientesSuspendidosCon: unaCantidadDeSuspendidos CantidadTotalDeClientes: unaCantidadDeClientes Para: unLibroDeClientes
	self assert: unaCantidadDeActivos equals: unLibroDeClientes numberOfActiveCustomers.
	self assert: unaCantidadDeSuspendidos equals: unLibroDeClientes numberOfSuspendedCustomers.
	self assert: unaCantidadDeClientes equals: unLibroDeClientes numberOfCustomers.

! !

!CustomerBookTest methodsFor: 'auxiliares - assertion' stamp: 'AG 10/13/2021 18:13:41'!
verificarClienteNoVacioConBloque: unBloque para: customerBook
	
	[ unBloque value.
	self fail ]
		on: Error
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'auxiliares - assertion' stamp: 'AG 10/13/2021 18:30:33'!
verificarParaUnUnicoClienteCon: unBloque conError: unError con: libroDeClientes para: unCliente
	
	[ unBloque value.
	self fail ]
		on: unError
		do: [ :anError | 
			self assert: libroDeClientes numberOfCustomers = 1.
			self assert: (libroDeClientes includesCustomerNamed: unCliente) ]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AG 10/13/2021 18:33:58'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AG 10/13/2021 19:07:28'!
removeCustomerNamed: aName 
 	(((self removerCliente: aName de: active) = aName) or: ((self removerCliente: aName de: suspended) = aName)) ifTrue: [^aName].
	^ NotFound signal
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'AG 10/13/2021 18:35:19'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'AG 10/13/2021 19:02:40'!
removerCliente: unCliente de: unaLista

	1 to: unaLista size do: 
		[ :index |
			unCliente = (unaLista at: index)
				ifTrue: [
					unaLista removeAt: index.
					^ unCliente 
				] 
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
