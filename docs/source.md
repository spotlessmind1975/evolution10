# SOURCE CODE (EXPLAINED)

Below you will find the source code of the video game. The source code has been written extensively (without abbreviations), in order to make it easier to understand. Each line has been commented to illustrate how the code works.

## INITIALIZATION (LINE 1)

<pre>0 x=53280:pokex,0:pokex+1,0</pre>

Now we set the background and border color of the screen ([here for a complete map](https://www.c64-wiki.com/wiki/Page_208-211)). The best is to use the black color (0) for both. This is "classic" color of my games.

<pre>x=rnd(-TI*peek(x-14))</pre>

We carry out a first and deep initialization of the random number generator. This form of initialization is necessary because the game relies heavily on a random component and, in the absence of this formulation, the game is likely to be repetitive with the use of emulators. So, in addition to using the internal clock (`TI`) we will also use the least significant byte of the electron beam position.

<pre>print"{clear}{down}{down}{down}{down}{red}e{green}v{yellow}o{blue}l{red}u{green}t{yellow}i{blue}o{red}n {white}10";</pre>

We print the game title.

<pre>e=5</pre>

We use this variable to maintain the number of individuals present for each generation. Individuals are made up of the four presented to the player, and which vary, plus a fifth representing the goal to be achieved.

<pre>g=5</pre>

Instead, this variable contains the number of genes that make up the genome of each individual. Each gene encodes a different aspect, and it takes 5 to draw an individual.

<pre>n$="1234t"</pre>

This variable contains the title (label) of each individual. We use this technique instead of printing a number as in BASIC V2 it is not possible to print a number without having it followed by a space, which is not aesthetically acceptable.

<pre>h$="{red}{green}{yellow}{blue}"</pre>

This is the set of colors encoded by gene 1.

<pre>t$="{171}{166}{113}#"</pre>

This is the set of tails encoded by gene 5.

<pre>b$="{99}{219}{178}{177}"</pre>

This is the set of intermediate elements of the body, including those encoded by genes 3 and 4.

<pre>1 print</pre>

We print an empty line (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>rk=1</pre>

We initialize the number of the gene that will undergo a random mutation. This gene is reset at each turn.

<pre>dimc(e,g)</pre>

This array contains the genes of all existing individuals.

<pre>dimd(e,g)</pre>

This is an auxiliary array, which contains a copy of the genes that will take the place of those contained in the previous array when the transition to a new generation is complete.

<pre>for i=1 to e:for j=1 to g:c(i,j)=1+int(rnd(1)*3):nextj:nexti</pre>

This routine initializes the gene of all individuals to a random value.

<pre>print"{white}choose phenotypes!"</pre>

We print the game's pay off.

<pre>print:print:</pre>

We print empty lines (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>i=e:gosub9:ff$=f$</pre>

In order to pre-calculate the target phenotype (the fifth), we render its genotype as a string by calling the function on line 9 and put the result into the `ff$` variable.

<pre>x=1</pre>

This variable contains the number of the generation reached.

## GAME LOOP (LINE 2-7)

### PHENOTYPES PRESENT (LINE 2)

<pre>2 print "{white}target: ";ff$;</pre>

We give the player an indication of which phenotype we want to achieve.

<pre>print:print</pre>

We print empty lines (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>print "{white}generation ";x;":"</pre>

We give the player indications of which generation we are showing.

<pre>for i=1 to e-1: gosub9 : print"{white}";mid$(n$,i,1);"]";f$;" ";:nexti:</pre>

We do a loop for each individual (minus the last one, which is the goal). For each one we call the function to render the genotype and print it on the screen, with an identification number.

<pre>print</pre>

We print empty line (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>print"{white}choose (1-4 1-4):";</pre>

Now let's give the player the option to indicate the two individuals that will be combined, to produce the next generation.

### ASK FOR INDIVIDUALS TO MIX (LINE 3)

<pre>3 r=rnd(1): rm=rnd(1)</pre>

We pre-calculate two random values, which will be used later.

<pre>gosub 8: x$=k$</pre>

We call the subroutine that waits for the pressing of a key from 1 to 4 (on line 8) and we retrieve the key pressed, assigning it to the variable `x$`.

<pre>print "{white} + ";</pre>

We print the plus symbol to indicate that the first indicated individual will be added to the second that will be typed.

<pre>gosub 8: y$=k$</pre>

We call the subroutine that waits for the pressing of a key from 1 to 4 (on line 8) and we retrieve the key pressed, assigning it to the variable `y$`.

<pre>print:print:</pre>

We print empty lines (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>on -(x$<>y$) goto 4: print"{red}you have to choose different phenotypes!{white}": goto 3</pre>

If the player has indicated two equal numbers, then it is a mistake because it is not possible to combine an individual with himself. So we report it with an error message and go back to waiting for a key to be pressed.

### FEEDBACK ON INDIVIDUALS MIXED (LINE 4)

<pre>4 print</pre>

We print empty line (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

<pre>i=val(x$): gosub 9: print "{white}";mid$(n$,i,1);"]";f$;</pre>

Now we call the function to render the genotype and print it on the screen, as the first individual to mix.

<pre>print"{white} + ";</pre>

We print the plus symbol to indicate that the first individual will be added to the second.

<pre>i=val(y$):gosub9:print"{white}";mid$(n$,i,1);"]";f$</pre>

Now we call the function to render the genotype and print it on the screen, as the second individual to mix.

<pre>print</pre>

We print empty line (*empty lines are interleaved with the logic for a matter of occupation and respect for the length of the BASIC lines*).

### PRODUCE NEXT GENERATION (LINES 4-6)

<pre>for i=1 to g:d(1,i)=c(val(x$),i)
5 d(2,i)=c(val(y$),i) : next i</pre>

With this loop we copy the genotype of the two selected individuals as the first two (progenitors) of the others that will be generated.

<pre>for i=3 to e-1: for j=1 to g: d(i,j)=d(1-(rnd(1)>.5),j) : next j : next i</pre>

All children will randomly take one of the genes from the first or second parent.

<pre>on -(r>.8) goto 6: d(3-(rm>.5),rk) = 1 + int(rnd(1)*3)</pre>

Sometimes, quite by chance, one of the genes of one of the children will undergo a mutation, which will cause it to be different from both the first and the second parent.

<pre>6 rk=int(rnd(1)*4)</pre>

We reload the number of the gene that will eventually undergo the random modification.

<pre>for i=1 to e-1: for j=1 to g: c(i,j)=d(i,j) : next j : gosub 9 : on-(f$=ff$) goto 7: next i</pre>

We copy the genes stored in the supporting array into the main one, in order to give rise to the new generation of individuals. In doing this, we will generate the phenotype for each and compare it with the target one. If there is an identity, the game will end and the player will be taken to line 7.

<pre>x = x + 1 : goto 2</pre>

Let's move on to the next generation, and go back to line 2.

### THE PLAYER WINS! (LINE 7)

<pre>7 print "{white}you win in ";x;"generations with: ";: gosub 9 : print f$;"{white}" : end</pre>

In the event that the player has managed, after a certain number of generations, to obtain the requested specimen, a message will be shown on the screen showing the result and the number of generations produced.

### KEYBOARD INPUT ROUTINE (LINE 8)

<pre>8 k$="" : get k$ : on -(k$="" or val(k$)<1 or val(k$)>4 ) goto 8: print "{white}";k$; : return</pre>

This routine takes care of keeping the player pressing one of the keys. The expected keys range from 1 to 4 inclusive and indicate which of the individuals will be selected for the next generation.

### GENOTYPE TO PHENOTYPE CONVERSION (LINE 9)

<pre>9 f$=mid$(h$,c(i,1),1) : for j=1 to c(i,2): f$=f$+mid$(b$,c(i,3),1) : next j : f$=f$+mid$(b$,c(i,4),1)+mid$(t$,c(i,5),1) : return</pre>

This routine deals with converting each individual's genotype into a phenotype. This conversion is not straightforward because the genotype contains only a "recipe" of how the individual should look, ie how it should be rendered on screen. This routine is responsible for converting the genotype (a set of numbers) into a phenotype (a string). For a details information please refer to the [EVOLUTION 10'S GENOTYPE AND PHENOTYPE](https://retroprogramming.iwashere.eu/evolution10:genotype) article on [author's retroprogramming website](https://retroprogramming.iwashere.eu).