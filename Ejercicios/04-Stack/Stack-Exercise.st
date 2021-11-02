!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackContent stackState stackStateSwitcher'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'AS 11/1/2021 21:08:30'!
initialize
	stackContent := OrderedCollection new.
	stackState := EmptyState new.
	stackStateSwitcher := StackStateSwitcher new.! !


!OOStack methodsFor: 'testing' stamp: 'AS 10/31/2021 18:16:05'!
isEmpty
	^ self size = 0.! !


!OOStack methodsFor: 'popping' stamp: 'AS 11/1/2021 20:43:14'!
pop
	^stackState popFromStack: self! !


!OOStack methodsFor: 'pushing' stamp: 'AS 11/1/2021 20:54:26'!
push: aString 
	stackState push: aString toOOStack: self.! !


!OOStack methodsFor: 'accessing' stamp: 'AS 11/1/2021 20:39:34'!
size
	^stackContent size! !

!OOStack methodsFor: 'accessing' stamp: 'AS 11/1/2021 20:41:04'!
top
	^stackState topFrom: self! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:42:55'!
cambiarTipo: unTipo
	stackState := unTipo! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 21:12:03'!
xxxx
	| item |
	item := stackContent removeLast.
	stackStateSwitcher switchState: self.
	^ item! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:39:48'!
yyyy
	^ stackContent at: self size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:54:44'!
zzzz: aString
	stackContent add: aString
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AS 10/31/2021 17:54:04'!
isEmpty
	^ true.! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:36:41'!
popFromStack: OOStack
	^ self error: 'Stack is empty'! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 21:08:45'!
push: aString toOOStack: anOOStack
	anOOStack cambiarTipo: NonEmptyState new.
	anOOStack zzzz: aString! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:41:16'!
topFrom: anOOStack
	^ self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #NonEmptyState category: 'Stack-Exercise'!
StackState subclass: #NonEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AG 10/31/2021 18:48:14'!
isEmpty
	^ false! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:51:30'!
popFromStack: OOStack	
	^ OOStack xxxx.
	
	! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:31:31'!
push: aString toOOStack: anOOStack
	anOOStack zzzz: aString! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 20:51:36'!
topFrom: OOStack

	^ OOStack yyyy! !


!classDefinition: #StackStateSwitcher category: 'Stack-Exercise'!
Object subclass: #StackStateSwitcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStateSwitcher methodsFor: 'as yet unclassified' stamp: 'AS 11/1/2021 21:13:14'!
switchState: anOOStack
	(anOOStack size = 0) ifTrue:[anOOStack cambiarTipo: EmptyState new.].! !
