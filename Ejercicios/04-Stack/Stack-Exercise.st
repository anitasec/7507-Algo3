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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 19:45:35'!
test01XXX

	| stack sentenceFinder |

	stack := OOStack new.
	self assert: stack isEmpty.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 19:56:57'!
test02XXX

	| stack sentenceFinder |

	stack := OOStack new.
	stack push: 'winter is coming'; push: 'winning is everything'; push: 'The winds of Winter'; push: 'Winter is here'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	sentenceFinder find: 'wint'! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 20:14:52'!
test03SentenceFinderByPrefixWhenFindStackIsNotModified

	| stack sentenceFinder |

	stack := OOStack new.
	stack push: 'winter is coming'; push: 'winning is everything'; push: 'The winds of Winter'; push: 'Winter is here'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	sentenceFinder find: 'wint'! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackContent stackState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'AG 11/2/2021 13:42:25'!
initialize

	stackContent := OrderedCollection new.
	stackState := EmptyState new.! !


!OOStack methodsFor: 'testing' stamp: 'AG 11/2/2021 13:42:30'!
isEmpty

	^ self size = 0.! !


!OOStack methodsFor: 'popping' stamp: 'AG 11/2/2021 13:42:37'!
pop

	^stackState popFromStack: self! !


!OOStack methodsFor: 'pushing' stamp: 'AG 11/2/2021 13:42:52'!
push: aString 

	stackState push: aString toOOStack: self.! !


!OOStack methodsFor: 'accessing' stamp: 'AG 11/2/2021 13:43:07'!
size

	^stackContent size! !

!OOStack methodsFor: 'accessing' stamp: 'AG 11/2/2021 13:43:21'!
top

	^stackState topFrom: self! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:42:44'!
popAnElement

	| item aSubclass |
	item := stackContent removeLast.
	
	aSubclass := StackState subclasses detect: [ :subclass | subclass canInstanciateWith: (stackContent size)].
	self switchState: aSubclass new.
	^ item! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:43:00'!
pushElement: anElement

	stackContent add: anElement.
	self switchState: NonEmptyState new.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:43:14'!
switchState: aNewStackState

	stackState := aNewStackState! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:43:28'!
viewTop

	^ stackContent at: self size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'prefixes stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 21:29:30'!
find: aPrefix

	| stackAux top|
	stackAux := OOStack new.
	[stack isEmpty] whileFalse: [ 
		top := stack pop.
		((top findString: aPrefix startingAt: 1 caseSensitive: true) = 1) ifTrue:[
			prefixes add: top]	.
		stackAux push: top.
	].

	[stackAux isEmpty] whileFalse: [ 
		stack push: stackAux pop.
	].

	^ prefixes
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 19:47:57'!
initalizeWith: aStack 
	
	stack := aStack.
	prefixes := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AS 11/2/2021 19:43:21'!
with: aStack
	
	^self new initalizeWith: aStack! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:23'!
isEmpty

	^ self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:28'!
popFromStack: OOStack

	^ self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:33'!
push: aString toOOStack: anOOStack

	^ self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:37'!
topFrom: anOOStack

	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:45:03'!
canInstanciateWith: aSize

	^ self subclassResponsibility ! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:42:01'!
isEmpty

	^ true.! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:42:05'!
popFromStack: OOStack

	^ self error: 'Stack is empty'! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AA 11/2/2021 13:34:57'!
push: aString toOOStack: anOOStack

	anOOStack pushElement: aString! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:42:12'!
topFrom: anOOStack

	^ self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:43:52'!
canInstanciateWith: aSize

	^aSize = 0! !


!classDefinition: #NonEmptyState category: 'Stack-Exercise'!
StackState subclass: #NonEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:52'!
isEmpty

	^ false! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:56'!
popFromStack: OOStack	

	^ OOStack popAnElement.
	
	! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:41:47'!
push: aString toOOStack: anOOStack

	anOOStack pushElement: aString! !

!NonEmptyState methodsFor: 'as yet unclassified' stamp: 'AA 11/2/2021 13:27:52'!
topFrom: OOStack

	^ OOStack viewTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyState class' category: 'Stack-Exercise'!
NonEmptyState class
	instanceVariableNames: ''!

!NonEmptyState class methodsFor: 'as yet unclassified' stamp: 'AG 11/2/2021 13:44:01'!
canInstanciateWith: aSize

	^aSize > 0! !
