0x=53280:pOx,0:pOx+1,0:x=rN(-TI*pE(x-14)):?"{clear}{down}{down}{down}{down}{red}e{green}v{yellow}o{blue}l{red}u{green}t{yellow}i{blue}o{red}n {white}10";:e=5:g=5:n$="1234t":h$="{red}{green}{yellow}{blue}":t$="{171}{166}{113}#":b$="{99}{219}{178}{177}"
1?:rk=1:dIc(e,g):dId(e,g):fOi=1toe:fOj=1tog:c(i,j)=1+int(rN(1)*3):nEj:nEi:?"{white}choose phenotypes!":?:?:i=e:goS9:ff$=f$:x=1
2?"{white}target: ";ff$;:?:?:?"{white}generation";x;":":fOi=1toe-1:goS9:?"{white}";mI(n$,i,1);"]";f$;" ";:nEi:?:?"{white}choose (1-4 1-4):";
3r=rN(1):goS8:x$=k$:?"{white} + ";:goS8:y$=k$:?:?:on-(x$<>y$)gO4:?"{red}you have to choose different phenotypes!{white}":gO3
4?:i=vA(x$):goS9:?"{white}";mI(n$,i,1);"]";f$;:?"{white} + ";:i=vA(y$):goS9:?"{white}";mI(n$,i,1);"]";f$:?:fOi=1tog:d(1,i)=c(vA(x$),i)
5d(2,i)=c(vA(y$),i):nEi:fOi=3toe-1:fOj=1tog:d(i,j)=d(1-(rN(1)>.5),j):nEj:nEi:on-(r>.6)gO6:d(4,rk)=1+int(rN(1)*3)
6rk=int(rN(1))*3:fOi=1toe-1:fOj=1tog:c(i,j)=d(i,j):nEj:goS9:on-(f$=ff$)gO7:nEi:x=x+1:gO2
7?"{white}you win in ";x;"generations with: ";:goS9:?f$;"{white}":eN
8k$="":gEk$:on-(k$=""orvA(k$)<1orvA(k$)>5)gO8:?"{white}";k$;:reT
9f$=mI(h$,c(i,1),1):fOj=1toc(i,2):f$=f$+mI(b$,c(i,3),1):nEj:f$=f$+mI(b$,c(i,4),1)+mI(t$,c(i,5),1):reT