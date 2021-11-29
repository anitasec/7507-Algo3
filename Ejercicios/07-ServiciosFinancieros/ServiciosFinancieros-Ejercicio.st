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

!TestPortfolio methodsFor: 'tests' stamp: 'AG 11/28/2021 19:59:48'!
test03PorfolioWithTwoAccountsWithOneDepositEachShouldHaveTheSumAsBalance
	
	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	portfolio addAccount: account2.
	
	self assert: portfolio balance equals: 300 * peso.! !

!TestPortfolio methodsFor: 'tests' stamp: 'AG 11/28/2021 20:00:08'!
test04PorforlioWithAnAccountWithWithdrawShouldRegisterWithdrawTransaction

	| portfolio account withdraw |
	
	account := ReceptiveAccount new.
	
	withdraw := Withdraw register: 50 * peso on: account.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	self assert: (portfolio hasRegistered: withdraw).! !

!TestPortfolio methodsFor: 'tests' stamp: 'AG 11/29/2021 03:37:24'!
test05PortfolioHasNoAccountWithTheSearchedRegisteredTransaction

	| portfolio account1 account2 deposit |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account2.
	
	portfolio := Portfolio new.

	portfolio addAccount: account1.
	
	self deny: (portfolio hasRegistered: deposit ).! !

!TestPortfolio methodsFor: 'tests' stamp: 'AS 11/28/2021 16:45:56'!
test06PorfolioWithAnAccountWithNoTransactionsShouldNotHaveTransactions

	| portfolio account listOfTransactions |
	
	account := ReceptiveAccount new.
	
	portfolio := Portfolio new.

	portfolio addAccount: account.
	
	listOfTransactions := portfolio transactions.
	
	self assert: listOfTransactions isEmpty
	! !

!TestPortfolio methodsFor: 'tests' stamp: 'AG 11/29/2021 03:46:13'!
test07PortfolioWithAccountsWithTransactionShouldHaveTheSameTransactions

	| portfolio listOfTransactions account deposit transactions |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
		
	transactions := OrderedCollection new.
	transactions add: deposit.
		
	portfolio := Portfolio new.

	portfolio addAccount: account.

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

!TestTransfer methodsFor: 'tests' stamp: 'AG 11/28/2021 19:42:59'!
test03ZeroPesoTransferShouldReturnInvalidTransferError

	self assertThatTransferAmountIsInvalidTransferErrorForAmount: 0 * peso
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AG 11/28/2021 19:43:29'!
test04NegativeTransferShouldReturnInvalidTransferError

	self assertThatTransferAmountIsInvalidTransferErrorForAmount: -5 * peso
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AG 11/29/2021 11:03:53'!
test05TransferWithdrawLegKnowsItsDepositLeg

	| originAccount destinationAccount transfer |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assertTheLeg: (transfer getDepositLeg) knowsItsCounterpart: (transfer getWithdrawLeg)
	
! !

!TestTransfer methodsFor: 'tests' stamp: 'AG 11/29/2021 11:03:53'!
test06TransferDepositLegKnowsItsWithdrawLeg

	| originAccount destinationAccount transfer |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assertTheLeg: (transfer getWithdrawLeg) knowsItsCounterpart: (transfer getDepositLeg )
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

!TestTransfer methodsFor: 'auxiliary' stamp: 'AG 11/29/2021 10:40:55'!
assertTheLeg: aLeg knowsItsCounterpart: anotherLeg
			
	self assert: anotherLeg equals: aLeg counterpart.
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AG 11/29/2021 14:04:57'!
affectBalance: aBalance
	
	^ self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'AS 11/28/2021 16:48:21'!
value 

	^ self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'AS 11/28/2021 18:06:35'!
initializeFor: aValue

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


!Deposit methodsFor: 'value' stamp: 'AG 11/29/2021 13:58:15'!
affectBalance: aBalance
	
	aBalance increaseValue: self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositLeg
	instanceVariableNames: 'transfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'initialization' stamp: 'AG 11/29/2021 10:42:38'!
initializeFor: aValue with: aTransfer
	
	value := aValue.
	transfer := aTransfer ! !


!DepositLeg methodsFor: 'accessing' stamp: 'AG 11/29/2021 02:24:54'!
counterpart
	^ transfer getWithdrawLeg .! !


!DepositLeg methodsFor: 'value' stamp: 'AG 11/29/2021 14:03:03'!
affectBalance: aBalance
	
	aBalance increaseValue: self value! !

!DepositLeg methodsFor: 'value' stamp: 'AG 11/29/2021 10:46:28'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'AG 11/29/2021 10:41:54'!
for: aValue with: aTransfer

	^ self new initializeFor: aValue with: aTransfer! !

!DepositLeg class methodsFor: 'instance creation' stamp: 'AG 11/29/2021 04:22:28'!
register: aValue on: account from: aTransfer

	| transaction |
	
	transaction := self for: aValue with: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AG 11/29/2021 14:01:30'!
affectBalance: aBalance

	aBalance decreaseValue: self value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawLeg
	instanceVariableNames: 'transfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!WithdrawLeg methodsFor: 'accessing' stamp: 'AG 11/29/2021 11:03:53'!
counterpart

	^transfer getDepositLeg ! !


!WithdrawLeg methodsFor: 'value' stamp: 'AG 11/29/2021 14:03:12'!
affectBalance: aBalance
	
	aBalance decreaseValue: self value! !

!WithdrawLeg methodsFor: 'value' stamp: 'AG 11/29/2021 10:42:54'!
initializeFor: aValue with: aTransfer
	
	value := aValue.
	transfer := aTransfer ! !

!WithdrawLeg methodsFor: 'value' stamp: 'AG 11/29/2021 10:46:35'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'AG 11/29/2021 10:43:27'!
for: aValue with: aTransfer

	^ self new initializeFor: aValue with: aTransfer! !

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'AG 11/29/2021 04:22:57'!
register: aValue on: account from: aTransfer

	| transaction |
	
	transaction := self for: aValue with: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Balance category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Balance
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Balance methodsFor: 'accessing' stamp: 'AG 11/29/2021 13:59:41'!
totalValue
	
	^value! !


!Balance methodsFor: 'initialization' stamp: 'AG 11/29/2021 13:47:03'!
initialize

	value := 0*peso! !


!Balance methodsFor: 'main protocol' stamp: 'AG 11/29/2021 14:01:30'!
decreaseValue: aValue

	value := value - aValue! !

!Balance methodsFor: 'main protocol' stamp: 'AG 11/29/2021 14:01:16'!
increaseValue: aValue

	value := value + aValue! !


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAccount methodsFor: 'accessing' stamp: 'AG 11/28/2021 20:35:00'!
transactions

	^ self subclassResponsibility ! !


!BankAccount methodsFor: 'main protocol' stamp: 'AG 11/28/2021 20:35:38'!
balance

	^ self subclassResponsibility ! !

!BankAccount methodsFor: 'main protocol' stamp: 'AG 11/28/2021 20:35:13'!
hasRegistered

	^ self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #Portfolio
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

!Portfolio methodsFor: 'main protocol' stamp: 'AG 11/29/2021 11:13:12'!
hasRegistered: aTransaction 

	^listOfAccounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction]! !


!Portfolio methodsFor: 'accesing' stamp: 'AS 11/27/2021 13:59:48'!
transactions 

	| totalOfTransactions |
	totalOfTransactions := OrderedCollection new.
	listOfAccounts do: [:anAccount | totalOfTransactions addAllLast: (anAccount transactions) ].
	^totalOfTransactions 
	! !


!Portfolio methodsFor: 'initialization' stamp: 'AG 11/26/2021 03:22:53'!
initialize

	listOfAccounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AG 11/29/2021 13:45:44'!
initialize

	transactions := OrderedCollection new.
	balance := Balance new! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AG 11/29/2021 14:00:39'!
balance

	^balance totalValue ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AG 11/29/2021 14:02:21'!
register: aTransaction

	transactions add: aTransaction.
	aTransaction affectBalance: balance
! !


!ReceptiveAccount methodsFor: 'accesing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'testing' stamp: 'AG 11/29/2021 11:02:43'!
isOfAmount: aValue

	^amount = aValue! !


!Transfer methodsFor: 'initialization' stamp: 'AG 11/29/2021 10:44:43'!
initializeWithTheDepositLeg: aDepositLeg andTheWithdrawLeg: aWithdrawLeg for: anAmountToTransfer 

	amount := anAmountToTransfer .
	depositLeg := aDepositLeg .
	withdrawLeg := aWithdrawLeg .! !


!Transfer methodsFor: 'transferLegs' stamp: 'AG 11/29/2021 11:03:53'!
getDepositLeg

	^depositLeg! !

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


!Transfer class methodsFor: 'initialization' stamp: 'AG 11/29/2021 10:50:03'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 

	| transfer aDepositLeg aWithdrawLeg |
	
	(anAmountToTransfer <= (0 * peso)) ifTrue: [^self error: Transfer invalidTransferError ].
		
	transfer := self new.
	
	aDepositLeg := DepositLeg register: anAmountToTransfer on: aDestinationAccount from: transfer.
	aWithdrawLeg := WithdrawLeg register: anAmountToTransfer on: anOriginAccount from: transfer.
	
	transfer initializeWithTheDepositLeg: aDepositLeg andTheWithdrawLeg: aWithdrawLeg for: anAmountToTransfer.
	
	^transfer! !
