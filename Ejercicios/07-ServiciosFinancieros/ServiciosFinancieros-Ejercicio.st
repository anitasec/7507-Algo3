!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AG 11/26/2021 13:51:38'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AG 11/26/2021 13:51:38'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AG 11/26/2021 13:51:38'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TestPortfolio category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestPortfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:54:57'!
test01
	
	| portfolio |

	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso.
	! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:54:57'!
test02
	
	| portfolio account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	self assert: portfolio balance equals: 100 * peso.! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:54:57'!
test03
	
	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	portfolio addAccount: account2.
	
	self assert: portfolio balance equals: 300 * peso.! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 03:37:21'!
test04

	| portfolio account withdraw |
	
	account := ReceptiveAccount new.
	
	withdraw := Withdraw register: 50 * peso on: account.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	self assert: (portfolio hasRegisteredTransaction: withdraw).! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 03:40:03'!
test05

	| portfolio account1 account2 withdraw deposit |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1..
	
	self deny: (portfolio hasRegisteredTransaction: withdraw).! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:21:17'!
test06

	| portfolio account listOfTransactions |
	
	account := ReceptiveAccount new.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	listOfTransactions := portfolio retrieveTransactionsOfAccount: account.
	
	self assert: listOfTransactions isEmpty
	! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:44:18'!
test07

	| portfolio account listOfTransactions account1 account2 deposit withdraw transactions withdraw2 |
	
	account := ReceptiveAccount new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account2.
	withdraw2 := Withdraw register: 10 * peso on: account2.
		
	transactions := OrderedCollection new.
	transactions add: deposit.
	transactions add: withdraw.
	transactions add: withdraw2.
		
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	portfolio addAccount: account2.

	listOfTransactions := portfolio retrieveTransactionsOfAccount: account.
	self assert: listOfTransactions equals: transactions ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 14:00:30'!
test08balance
	
	| portfolio anotherPortfolio account |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
		
	anotherPortfolio addAccount: account.	
	portfolio addAccount: anotherPortfolio.
	
	self assert: portfolio balance equals: 100 * peso.! !


!classDefinition: #TestTransfer category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:51:38'!
test01

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: originAccount balance equals: -100 * peso.
	self assert: destinationAccount balance equals: 100 * peso.
! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'AS 11/24/2021 18:21:55'!
test02

	| originAccount destinationAccount transfer|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 0 * peso.
	
	self assert: (transfer XXXX: 0 * peso).
	
! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'AS 11/24/2021 18:22:50'!
test03

	| originAccount destinationAccount transfer|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: (transfer XXXX: 100 * peso).
	
! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'AS 11/24/2021 18:38:21'!
test04Patas

	| originAccount destinationAccount transfer|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: (transfer YYYY: 100 * peso).
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'AG 11/19/2021 19:52:30'!
valueForBalance
	
	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'AG 11/19/2021 19:52:30'!
valueForBalance
	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'AG 11/19/2021 19:52:31'!
valueForBalance
	^ 0 * peso - self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'listOfAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 03:22:43'!
addAccount: aReceptiveAccount 

	listOfAccounts add: aReceptiveAccount ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 13:54:57'!
balance

	^listOfAccounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/25/2021 20:55:16'!
hasRegisteredTransaction: aTransaction 

	listOfAccounts do: [ :anAccount | (anAccount hasRegistered: aTransaction) ifTrue: [^true]].
	^false! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AG 11/26/2021 03:22:53'!
initialize

	listOfAccounts := OrderedCollection new.! !


!Portfolio methodsFor: 'accesing' stamp: 'AG 11/26/2021 13:39:43'!
retrieveTransactionsOfAccount: aReceptiveAccount 

	| totalOfTransactions |
	totalOfTransactions := OrderedCollection new.
	listOfAccounts do: [:anAccount | totalOfTransactions addAllLast: (anAccount transactions) ].
	^totalOfTransactions 
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AG 11/26/2021 13:51:00'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'testing' stamp: 'AS 11/24/2021 18:28:03'!
XXXX: aValue
	^aValue = amount! !

!Transfer methodsFor: 'testing' stamp: 'AS 11/24/2021 18:27:29'!
initializeWith: aValue
	amount := aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'initialization' stamp: 'AS 11/24/2021 18:28:41'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 

	| transfer |
	transfer := self new.
	transfer initializeWith: anAmountToTransfer .
	
	Deposit register: anAmountToTransfer on: aDestinationAccount.
	Withdraw register: anAmountToTransfer on: anOriginAccount.
	
	^transfer! !
