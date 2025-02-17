# GNU Prolog Reference Manual

## How to Get and Install
Download from the [GNU Prolog Website](http://www.gprolog.org). It is available as binary for Windows and macOS. One can also obtain the source code for the ones who really want to know it.


## Starting and Stopping
- Start the program: type `gprolog` in the terminal

- Quit the program with typing `halt.`. Take care of the period (.) at the end of the command. This results from the fact that every *predicate* is terminated with a period to tell the prolog system that we are finished.

## Loading Predicates and Definitions
Programs can be edited with your favourite editor. To load a program named `firstProgram.pl` type `consult('firstProgram.pl').`. A short form for the predicate `consult/1` is `[]`, where the file is placed between the sqare brackets.

If one wants to start with only a few predicates directly typed into the terminal one can use the predefined file `user`. So we type `[user].` to start our first experiments.

## First predicates (Facts)
We specify some properties of animals (called Fritz and Burli). Please note that Prolog is case sensitive, i. e., you have to take care of upper and lower case letters.

```Prolog
croaks(fritz).
eatsFlies(fritz).
chirps(burli).
sings(burli).
```

To exit the "input mode", we type `Ctrl D`. Now we can ask the prolog system whether an animal given croaks or eats flies:

```Prolog
?- croaks(fritz).
yes
?- croaks(burli).
no
?-
```
We can see that Prolog is a very conservative system in case it does not know the answer. If we ask, for example, whether `sepp` croaks or eatsFlies, etc., we will get `no` in all cases.
### Caution
Take care that all **constants** have to start with **lower case letters**. `Mary` would not be a constant anymore but a variable since all **variables** start with **upper case letters**.

## More Predicates (Rules) and the Logical Or
Now we can specify that something that croaks and eats flies, is a frog. Furthermore we specify that something that sings and chirps is a canary. In prolog this looks like as follows (do not forget to enter `[user].` before you start typing the new rules.):
```Prolog
isFrog(X) :- croaks(X), eatsFlies(X).
isCanary(X) :- chirps(X), sings(X).
```
Again note the syntactic specifics of Prolog here:
- `:-` separates the condition from the action part
- The action part is written before the condition part
- The **logical and** is denoted as `,` (a comma)

Now we can ask our system, whether Fritz is a frog or whether it is a canary, etc.
```Prolog
?- isFrog(fritz)
yes
?- isCanary(fritz)
no
```
## Asking for Solutions
We can go one step further and ask "Who is a frog"
```Prolog
?- isFrog(X).
X = fritz
yes
?-
```

## Logical Or
Now it is time to move our little code base into an extra file. Collect everything and put it into a file, say `firstSteps.pl`. Now we it also makes sense to add little comments. As most programming languages Prolog supports block comments (using /* and */ like in C) and line comments (using % which is again a bit weird but ... you know). Finally we add some more animals. Take care that all predicates with the same name have to be in consecutive order. 

Ah and two more things:
1. We add facts which of the given animals are female. For example purposes we only assume female and non-female sexes.
2. We add some colors to the animals.
   
We end up with a file looking like this:

```Prolog
/* Simple prolog clauses to get a first impression */

croaks(fritz).
croaks(berta).
croaks(kermit).
eatsFlies(fritz).
eatsFlies(berta).
eatsFlies(kermit).

chirps(burli).
chirps(heidi).
chirps(mia).
sings(burli).
sings(heidi).
sings(mia).

color(fritz, green).
color(berta, green).
color(kermit, brown).
color(burli, green).
color(heidi, yellow).
color(mia, blue).

isFemale(berta).
isFemale(heidi).
isFemale(mia).

isFrog(X) :- croaks(X), eatsFlies(X). % the first rule
isCanary(X) :- chirps(X), sings(X).
```

Now we can add a clause checking whether two animals look alike. We say that two animals look alike if they
1. are of the same species
2. have the same color.

Lets start by adding a helper predicate `isSameSpecies/2` to our code base:

```Prolog
isSameSpecies(X, Y) :- isFrog(X), isFrog(Y).
isSameSpecies(X, Y) :- isCanary(X), isCanary(Y).
```
We modeled the **logical or** by giving two rules for the same predicate which pretty well works but gets a bit clumsy if things get more complicated. Therefore, Prolog offers an alternative way to model a **logicl or** by using a `;` (semicolon). So we can replace the above clause by the following:

```Prolog
isSameSpecies(X, Y) :- (isFrog(X), isFrog(Y) ; isCanary(X), isCanary(Y)).
```

## Equality and Inequality
Now we are ready to extend our knowledge base by adding a clause for checking whether animals look alike. The following steps are necessary:

1. We leverage the newly defined clause `isSameSpecies/2`,
2. We "get" the colors of both animals via `color/2`,
3. We check whether both colors are equal

In Prolog this looks like

```Prolog
doLookAlike(X, Y) :- isSameSpecies(X, Y),
    color(X, C1), color(Y, C2), 
    C1 = C2.
```
It is maybe worth to look a bit behind the scenes what happens here.
1. The Prolog system tries to bind two variables `X` and `Y` to make `isSameSpecies/2` true
2. In case it finds two values it tries to bind two variables `C1` and `C2` for `X` and `Y`, respectively to make `color/2` true
3. Finally it checks whether the the two bound variables `C1` and `C2` are equal

Alternatively could shorten the above clause by leveraging Prolog's pattern matching capabilities and state only one variable for color (`C`). Since Prolog then matches that `C` has to be bound to the same value the above rule reduces to

```Prolog
doLookAlike(X, Y) :- isSameSpecies(X, Y), color(X, C), color(Y, C).
```

Finally we could argue that it is a bit ridiculous, maybe even micrological that an animal looks alike itself. To get rid off this we add that `X` and `Y` must not be equal:

```Prolog
doLookAlike(X, Y) :- isSameSpecies(X, Y), color(X, C), color(Y, C), X \= Y.
```

## The Logical Not
In this final step we want to bring into our knowledge base whether two animals can reproduce. Although it is known that some frog species can reproduce without a sexual partner, for the sake of our example we do not consider these here.

So we start by adding a helper clause `canMate/2` which yields true if both arguments are animals of the same species and not equal which is trivial because we already know all the ingredients needed. Another helper clause we need is `hasDifferentSex/2`. Since we only have the clause `isFemale/1` to determine the sex we add a final helper clause `isMale/1` which, under the assumption of only two sexes, is logically equivalent to the negation of `isFemale/1`.

```Prolog
canMate(X, Y) :- isSameSpecies(X, Y), X \= Y.
isMale(X) :- \+ isFemale(X).
hasDifferentSex(X, Y) :- isFemale(X), isMale(Y).
canReproduce(X, Y) :- canMate(X, Y), hasDifferentSex(X, Y).
```

Experiment with the given knowledge base to get familiar with the whole system.
