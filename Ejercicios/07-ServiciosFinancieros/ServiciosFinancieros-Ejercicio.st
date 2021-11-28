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

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:40:39'!
test01EmptyPortfolioHasBalanceOfZeroPeso
	
	| portfolio |

	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso.
	! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:41:21'!
test02PortfolioWithAccountWithADepositOf100PesoShouldReturnBalanceOf100peso
	
	| portfolio account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	self assert: portfolio balance equals: 100 * peso.! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:42:31'!
test03PorfolioWithTwoAcountsWithOneDepositEachShouldHaveTheSumAsBalance
	
	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	portfolio addAccount: account2.
	
	self assert: portfolio balance equals: 300 * peso.! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:43:32'!
test04PorforlioWithAnAcountWithWithdrawShouldRegisterWithdrawTransaction

	| portfolio account withdraw |
	
	account := ReceptiveAccount new.
	
	withdraw := Withdraw register: 50 * peso on: account.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	self assert: (portfolio hasRegistered: withdraw).! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:45:00'!
test05PortfolioWithTwoAccountsShouldRegisterWithdrawTransaction

	| portfolio account1 account2 withdraw |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	
	self deny: (portfolio hasRegistered: withdraw).! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:45:56'!
test06PorfolioWithAnAccountWithNoTransactionsShouldNotHaveTransactions

	| portfolio account listOfTransactions |
	
	account := ReceptiveAccount new.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	listOfTransactions := portfolio transactions.
	
	self assert: listOfTransactions isEmpty
	! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:46:41'!
test07PortfolioWithTwoAccountsWithTransactionsShouldHaveTransactions

	| portfolio listOfTransactions account1 account2 deposit withdraw transactions withdraw2 |
	
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

	listOfTransactions := portfolio transactions.
	self assert: listOfTransactions equals: transactions ! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:47:09'!
test08PortfolioWithPortfolioShouldHaveBalanceOfPortfolio
	
	| portfolio anotherPortfolio account |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
		
	anotherPortfolio addAccount: account.	
	portfolio addAccount: anotherPortfolio.
	
	self assert: portfolio balance equals: 100 * peso.! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:47:24'!
test09PortfolioWithPortfolioHasPorfoliosRegisteredTransaction
	
	| portfolio anotherPortfolio account deposit|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
		
	anotherPortfolio addAccount: account.	
	portfolio addAccount: anotherPortfolio.
	
	self assert: (portfolio hasRegistered: deposit).! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:47:40'!
test10PortfolioWithPortfolioRetrieveAllTransactionsFromPorfolio
	
	| portfolio anotherPortfolio account deposit listOfTransactions transactions |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	transactions := OrderedCollection new.
	transactions add: deposit.
		
	anotherPortfolio addAccount: account.	
	portfolio addAccount: anotherPortfolio.
	
	listOfTransactions := portfolio transactions.
	self assert: listOfTransactions equals: transactions! !


!classDefinition: #TestTransfer category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestTransfer methodsFor: 'tests' stamp: 'AS 11/28/2021 17:54:20'!
test01TransferBetweenAccountsShouldMakeAccountsAlterTheirBalance

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: originAccount balance equals: -100 * peso.
	self assert: destinationAccount balance equals: 100 * peso.
! !

!TestTransfer methodsFor: 'tests' stamp: 'AS 11/28/2021 17:55:34'!
test02TransferOfAnAmountBetweenAccountsShouldRegisterTheSameAmount

	| originAccount destinationAccount transfer|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 1 * peso.
	
	self assert: (transfer isOfAmount: 1 * peso).
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AS 11/28/2021 17:56:54'!
test04TransferWithdrawLegKnowsItsDepositLeg

	| originAccount destinationAccount transfer withdrawLeg depositLeg |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	withdrawLeg := transfer getWithdrawLeg.
	
	depositLeg := withdrawLeg getDepositLeg. 
	
	self assert: transfer getDepositLeg equals: depositLeg.
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AS 11/28/2021 18:03:11'!
test05ZeroPesoTransferShouldReturnInvalidTransferError

	self assertThatTransferAmountIsInvalidTransferErrorForAmount: 0 * peso
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AS 11/28/2021 18:03:24'!
test06NegativeTransferShouldReturnInvalidTransferError

	self assertThatTransferAmountIsInvalidTransferErrorForAmount: -5 * peso
	
! !


!TestTransfer methodsFor: 'auxiliary' stamp: 'AS 11/28/2021 18:02:51'!
assertThatTransferAmountIsInvalidTransferErrorForAmount: anAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	self
		should: [ Transfer from: originAccount to: destinationAccount for: anAmount. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer invalidTransferError ]
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AS 11/28/2021 16:48:21'!
value 

	^ self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'AG 11/19/2021 19:52:30'!
valueForBalance
	
	^ self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'AS 11/28/2021 18:06:35'!
initializeFor: aValue

	^ self subclassResponsibility ! !

!AccountTransaction methodsFor: 'initialization' stamp: 'AS 11/28/2021 18:06:58'!
initializeWith: aTransfer

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

!Deposit methodsFor: 'value' stamp: 'AG 11/19/2021 19:52:30'!
valueForBalance
	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'initialization' stamp: 'AS 11/27/2021 14:30:54'!
initializeWith: aTransfer
	transfer := aTransfer ! !


!DepositLeg methodsFor: 'accessing' stamp: 'AS 11/27/2021 14:19:44'!
getWithdrawLeg
	^ transfer getWithdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'AS 11/27/2021 14:21:50'!
with: aTransfer
	
	^ self new initializeWith: aTransfer
	! !


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

!Withdraw methodsFor: 'value' stamp: 'AG 11/19/2021 19:52:31'!
valueForBalance
	^ 0 * peso - self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'initialization' stamp: 'AS 11/28/2021 18:06:10'!
initializeWith: aTransfer

	transfer := aTransfer ! !


!WithdrawLeg methodsFor: 'accessing' stamp: 'AS 11/28/2021 18:04:06'!
getDepositLeg

	^transfer getDepositLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'AS 11/27/2021 14:22:38'!
with: aTransfer
	
	^ self new initializeWith: aTransfer! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'listOfAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'AG 11/26/2021 03:22:43'!
addAccount: aReceptiveAccount 

	listOfAccounts add: aReceptiveAccount ! !

!Portfolio methodsFor: 'main protocol' stamp: 'AG 11/26/2021 13:54:57'!
balance

	^listOfAccounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'AS 11/27/2021 13:43:00'!
hasRegistered: aTransaction 

	listOfAccounts do: [ :anAccount | (anAccount hasRegistered: aTransaction) ifTrue: [^true]].
	^false! !

!Portfolio methodsFor: 'main protocol' stamp: 'AG 11/26/2021 03:22:53'!
initialize

	listOfAccounts := OrderedCollection new.! !


!Portfolio methodsFor: 'accesing' stamp: 'AS 11/27/2021 13:59:48'!
transactions 

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
	instanceVariableNames: 'amount withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'testing' stamp: 'AS 11/28/2021 16:39:18'!
amount
	^amount! !

!Transfer methodsFor: 'testing' stamp: 'AS 11/28/2021 16:39:41'!
isOfAmount: aValue
	^self amount = aValue! !


!Transfer methodsFor: 'initialization' stamp: 'AS 11/27/2021 14:27:10'!
initializeWith: aValue
	amount := aValue.
	
	depositLeg := DepositLeg with: self.
	withdrawLeg := WithdrawLeg with: self.! !


!Transfer methodsFor: 'transferLegs' stamp: 'AS 11/28/2021 18:05:45'!
getDepositLeg

	^ depositLeg! !

!Transfer methodsFor: 'transferLegs' stamp: 'AS 11/28/2021 18:05:43'!
getWithdrawLeg

	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errordescription' stamp: 'AS 11/27/2021 14:37:57'!
invalidTransferError

	^ 'Transfer must be greater than 0'! !


!Transfer class methodsFor: 'initialization' stamp: 'AS 11/27/2021 14:42:05'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 

	| transfer |
	
	(anAmountToTransfer <= (0 * peso)) ifTrue: [^self error: Transfer invalidTransferError ].
		
	transfer := self new.
	transfer initializeWith: anAmountToTransfer .
	
	Deposit register: anAmountToTransfer on: aDestinationAccount.
	Withdraw register: anAmountToTransfer on: anOriginAccount.
	
	^transfer! !
