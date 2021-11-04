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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/3/2021 22:06:20'!
test01WhenFindAPrefixInAEmptyStackShouldReturnEmptyCollection

	| sentenceFinder collection |

	sentenceFinder := SentenceFinderByPrefix with: OOStack new.
	
	collection := sentenceFinder find: 'Winter'.
	
	self assert: collection size equals: 0. 
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:08:34'!
test02WhenFindingAStringShouldReturnACollectionWithOneString

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'Winter'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Wint'.
	
	self assert: collection size equals: 1. 
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:08:39'!
test03WhenFindingAStringShouldReturnACollectionWithThatString

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'Winter'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Wint'.
	
	self assert: 'Winter' equals: collection first.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 01:15:35'!
test04WhenNotFindingAStringInAnStackWithOneStringShouldReturnAnEmptyCollection

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'Winter'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'winning'.
	
	self assert: 0 equals: collection size
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:10:20'!
test05WhenFindingTwoStringsShouldReturnACollectionWithSizeTwo

	| stack sentenceFinder collection |

	stack := OOStack new.
	stack push: 'winter is coming'; push: 'winning is everything'; push:  'The winds of winter'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'win'.
	
	self assert: collection size equals: 2.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:10:15'!
test06WhenFindingTwoStringsShouldReturnACollectionWithTwoStrings

	| stack sentenceFinder collection |

	stack := OOStack new.
	stack push: 'winter is coming'; push: 'winning is everything'; push:  'The winds of winter'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'win'.
	
	self assert: collection includes: 'winter is coming'.
	self assert: collection includes: 'winning is everything'.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:07:03'!
test07WhenNotFindingAStringInAStackWithMoreThanOneStringShouldReturnAnEmptyCollection

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'Winter'; push: 'winter is coming'; push: 'The winds of winter'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'winning'.
	
	self assert: 0 equals: collection size
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 04:07:23'!
test08WhenFindingOneStringInStackWithMoreThanOneStringsShouldReturnACollectionWithThatString

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'winter is coming'; push: 'winning is everything'; push: 'The winds of winter' .

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'winn'.
	
	self assert: 1 equals: collection size.
	self assert: collection includes: 'winning is everything'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 03:44:43'!
test09AfterUseFindTheStackBehavesLIFO

	| stack firstPushedObject secondPushedObject sentenceFinder |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentenceFinder find: 'Winter'.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AS 11/4/2021 11:00:16'!
test10AfterFindStackShouldHaveTheSameSizeAsBefore

	| stack sentenceFinder |
	
	stack := OOStack new push: 'Winter'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentenceFinder find: 'Winter'.
	
	self assert: 1 equals: stack size. ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 03:45:06'!
test11TheFinderDoesNotFindAStringIfContainThePrefixButNotInTheBeginning

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'The winds of Winter'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Wint'.
	
	self assert: 0 equals: collection size.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 03:45:26'!
test12WhenAPrefixIsEmptyShouldReturnError

	| sentenceFinder |

	sentenceFinder := SentenceFinderByPrefix with: OOStack new.
	
	self
		should: [ sentenceFinder find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ]
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 11/4/2021 03:45:38'!
test13WhenAPrefixContainsEmptySpaceShouldReturnError

	| sentenceFinder |

	sentenceFinder := SentenceFinderByPrefix with: OOStack new.
	
	self
		should: [ sentenceFinder find: 'winter is' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ]
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AS 11/4/2021 10:53:26'!
test14WhenNotInitializedWithAnOOStackShouldReturnError
	
	self
		should: [ SentenceFinderByPrefix with: 'Winter' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidInitialization ]
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AS 11/4/2021 11:00:39'!
test15ThePrefixIsCaseSensitiveAndFindReturnTheCorrectStrings

	| stack sentenceFinder collection |
	
	stack := OOStack new push: 'winter is coming'; push: 'Winter is here'.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Wint'.
	
	self assert: 1 equals: collection size.
	self assert: collection includes: 'Winter is here'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AS 11/4/2021 11:05:28'!
test16WhenStackContainsMultipleRelatedStrings

	 | stack sentenceFinder sentences expectedSentences |

    	expectedSentences := OrderedCollection new.
	expectedSentences add: 'Winter is here'.

    	stack := OOStack new.
    	stack push: 'winter is coming'; push: 'winning is everything'; push: 'The winds of Winter'; push: 'Winter is here'.

    	sentenceFinder := SentenceFinderByPrefix with: stack.

    	sentences := sentenceFinder find: 'Wint'.

    	self assert: expectedSentences equals: sentences! !


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


!OOStack methodsFor: 'private' stamp: 'AG 11/2/2021 13:42:44'!
popAnElement

	| item aSubclass |
	item := stackContent removeLast.
	
	aSubclass := StackState subclasses detect: [ :subclass | subclass canInstanciateWith: (stackContent size)].
	self switchState: aSubclass new.
	^ item! !

!OOStack methodsFor: 'private' stamp: 'AG 11/2/2021 13:43:00'!
pushElement: anElement

	stackContent add: anElement.
	self switchState: NonEmptyState new.
	! !

!OOStack methodsFor: 'private' stamp: 'AG 11/2/2021 13:43:14'!
switchState: aNewStackState

	stackState := aNewStackState! !

!OOStack methodsFor: 'private' stamp: 'AG 11/2/2021 13:43:28'!
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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 11/4/2021 15:00:54'!
findWithPrefix: aPrefix

	| stackAux top |
	
	(self prefixIsValid: aPrefix) ifFalse: [^ self error: SentenceFinderByPrefix invalidPrefixErrorDescription].

	stackAux := OOStack new.
	self popFromStack: stack evaluate:  
	[ top := stack top. (self prefixIsFound: aPrefix inString: top) ifTrue: [prefixes add: top] 	]
	pushToStack: stackAux.
	
	self popFromStack: stackAux evaluate: [] pushToStack: stack.

! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 11/2/2021 19:47:57'!
initalizeWith: aStack 
	
	stack := aStack.
	prefixes := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 11/4/2021 15:01:20'!
popFromStack: anOOStack evaluate: aBlock pushToStack: anotherOOStack

	[anOOStack isEmpty] whileFalse: [ 
		aBlock value.
		anotherOOStack push: anOOStack pop.
	].

! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 11/4/2021 13:11:31'!
prefixIsFound: aPrefix inString: aString

    ^ (aString findString: aPrefix startingAt: 1 caseSensitive: true) = 1! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 11/4/2021 13:25:46'!
prefixIsValid: aPrefix

    ^ (aPrefix size = 0 or: (aPrefix includesSubString: ' ')) not! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'AS 11/4/2021 14:46:44'!
find: aPrefix

	self findWithPrefix: aPrefix.
	^ prefixes
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AS 11/4/2021 10:52:04'!
invalidInitialization
	^ 'aStack has to be an instance of OOStack'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AS 11/3/2021 19:14:53'!
invalidPrefixErrorDescription
	^ 'Prefix is invalid'! !


!SentenceFinderByPrefix class methodsFor: 'class initialization' stamp: 'AS 11/4/2021 10:52:32'!
with: aStack
	
	(aStack isKindOf: OOStack) ifFalse: [ self error: self invalidInitialization ].
	
	^self new initalizeWith: aStack! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'popping' stamp: 'AG 11/2/2021 13:41:28'!
popFromStack: OOStack

	^ self subclassResponsibility ! !


!StackState methodsFor: 'testing' stamp: 'AG 11/2/2021 13:41:23'!
isEmpty

	^ self subclassResponsibility ! !


!StackState methodsFor: 'pushing' stamp: 'AG 11/2/2021 13:41:33'!
push: aString toOOStack: anOOStack

	^ self subclassResponsibility ! !


!StackState methodsFor: 'accesing' stamp: 'AG 11/2/2021 13:41:37'!
topFrom: anOOStack

	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'private' stamp: 'AG 11/2/2021 13:45:03'!
canInstanciateWith: aSize

	^ self subclassResponsibility ! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'accessing' stamp: 'AG 11/2/2021 13:42:12'!
topFrom: anOOStack

	^ self error: OOStack stackEmptyErrorDescription! !


!EmptyState methodsFor: 'popping' stamp: 'AS 11/3/2021 18:57:12'!
popFromStack: anOOStack

	^ self error: OOStack stackEmptyErrorDescription ! !


!EmptyState methodsFor: 'pushing' stamp: 'AA 11/2/2021 13:34:57'!
push: aString toOOStack: anOOStack

	anOOStack pushElement: aString! !


!EmptyState methodsFor: 'testing' stamp: 'AG 11/2/2021 13:42:01'!
isEmpty

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'private' stamp: 'AG 11/2/2021 13:43:52'!
canInstanciateWith: aSize

	^aSize = 0! !


!classDefinition: #NonEmptyState category: 'Stack-Exercise'!
StackState subclass: #NonEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyState methodsFor: 'testing' stamp: 'AG 11/2/2021 13:41:52'!
isEmpty

	^ false! !


!NonEmptyState methodsFor: 'popping' stamp: 'AG 11/2/2021 13:41:56'!
popFromStack: OOStack	

	^ OOStack popAnElement.
	
	! !


!NonEmptyState methodsFor: 'pushing' stamp: 'AG 11/2/2021 13:41:47'!
push: aString toOOStack: anOOStack

	anOOStack pushElement: aString! !


!NonEmptyState methodsFor: 'accessing' stamp: 'AA 11/2/2021 13:27:52'!
topFrom: OOStack

	^ OOStack viewTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyState class' category: 'Stack-Exercise'!
NonEmptyState class
	instanceVariableNames: ''!

!NonEmptyState class methodsFor: 'private' stamp: 'AG 11/2/2021 13:44:01'!
canInstanciateWith: aSize

	^aSize > 0! !
