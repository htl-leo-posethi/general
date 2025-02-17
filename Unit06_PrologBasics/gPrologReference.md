# IF.05.22_LOAL

## GNU Prolog Reference Manual

### How to Get and Install
Download from the [GNU Prolog Website](http://www.gprolog.org). It is available as binary for Windows and macOS. One can also obtain the source code for the ones who really want to know it.


### Starting and Stopping
- Start the program: type `gprolog` in the terminal

- Quit the program with typing `halt.`. Take care of the period (.) at the end of the command. This results from the fact that every *predicate* is terminated with a period to tell the prolog system that we are finished.

### Loading Predicates and Definitions
Programs can be edited with your favourite editor. To load a program named `firstProgram.pl` type `consult('firstProgram.pl').`. A short form for the predicate `consult/1` is `[]`, where the file is placed between the sqare brackets.

If one wants to start with only a few predicates directly typed into the terminal one can use the predefined file `user`. So we type `[user].` to start our first experiments.

### First predicates
We specify some properties of animals (called Fritz and Burli). Please note that Prolog is case sensitive, i. e., you have to take care of upper and lower case letters.

```
croaks(fritz).
eatsFlies(fritz).
chirps(burli).
sings(burli).
```

To exit the "input mode", we type `Ctrl D`. Now we can ask the prolog system whether an animal given croaks or eats flies:

```
?- croaks(fritz).
yes
?- croaks(burli).
no
?-
```
We can see that Prolog is a very conservative system in case it does not know the answer. If we ask, for example, whether `sepp` croaks or eatsFlies, etc., we will get `no` in all cases.
#### Caution
Take care that all **constants** have to start with **lower case letters**. `Mary` would not be a constant anymore but a variable since all **variables** start with **upper case letters**.

### More Predicates
Now we can specify that something that croaks and eats flies, is a frog. Furthermore we specify that something that sings and chirsp is a canary. In prolog this looks like as follows (do not forget to enter `[user].` before you start typing the new rules.):
```
isFrog(X) :- croaks(X), eatsFlies(X).
isCanary(X) :- chirps(X), sings(X).
```
Again note the syntactic specifics of Prolog here:
- `:-` separates the condition from the action part
- The action part is written before the condition part
- The logical and is denoted as a comma

Now we can ask our system, whether Fritz is a frog or whether it is a canary, etc.
```
?- isFrog(fritz)
yes
?- isCanary(fritz)
no
```
### Asking for Solutions
We can go one step further and ask "Who is a frog"
```
?- isFrog(X).
X = fritz
yes
?-
```
Experiment with the given knowledge base to get familiar with the whole system.
