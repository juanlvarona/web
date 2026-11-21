\\ Calculus of aliquot sequences with PARI-GP
\\ CAUTION: primality text only ensures strong pseudo-prime

\\ Sequence: 0276

fichero="SQ0276.pari";
n = 276;
ord = 1;

\\ PARA UNIX CON FICHERO "pari.log" COMO log
extern("/bin/rm pari.log");
default(logfile,"pari.log");
default(log,1);

show(F) =
{
    local(i, j);
    for (i=1, matsize(F)[1]-1, 
        for (j=1, F[i,2], 
            print1(F[i,1], " * ")
        )
     );
     i = matsize(F)[1];
     for (j=1, F[i,2]-1,
         print1(F[i,1], " * ")
     );
     print(F[i,1]);
}

sqfile(F) =
{
    local(i, j);
    for (i=1, matsize(F)[1]-1, 
        for (j=1, F[i,2], 
            write1(fichero, F[i,1], " * ")
        )
    );
    i = matsize(F)[1];
    for (j=1, F[i,2]-1,
       write1(fichero, F[i,1], " * ")
    );
    write(fichero, F[i,1]);
    \\ PARA UNIX CON FICHERO "pari.log" COMO log
    extern("/bin/rm pari.log");
    default(logfile,"pari.log");
}

s(num) =
{
    local(i, j, sn, snpartial, pacum, F);
    sn = 1;
    F = factorint(num);
    \\ print(F);           \\ PARI-GP notation for factorization
    show(F);               \\ our notation for factorization
    sqfile(F);
    for (i=1, matsize(F)[1],
        snpartial = 1;
        pacum = 1;
        for (j=1, F[i,2], 
            pacum = pacum * F[i,1];
            snpartial = snpartial + pacum
        );
        sn = sn * snpartial
    );
    sn = sn - num
}

cabecera(n,ord) =
{
    print1("\n---------------------------\n");
    print1("    Initial index: ", ord, "\n");
    print1("    Initial value: ", n);
    print1("\n---------------------------\n\n");
}
\\ Si no tuviera argumentos, se llamaria con "cabecera",
\\ no con "cabecera()"

bucle(n,ord) =
{
    local(cont);
    cont = ord;
    cabecera(n,ord);
    if(ord == 1, print(n); write(fichero, n), );
    while (n > 1,
        n = s(n);
        cont = cont + 1;
        print1(cont, "    ");
        write1(fichero, cont, "    ");
        if (cont < 1000, print1(" "); write1(fichero, " "), );
        if (cont < 100, print1(" "); write1(fichero, " "), );
        if (cont < 10, print1(" "); write1(fichero, " "), );
        print(n); ; write(fichero, n)
    );
    print("\nEND OF THE ALIQUOT SEQUENCE\n");
    write(fichero, "\nEND OF THE ALIQUOT SEQUENCE\n")
}

\g5
#

bucle(n,ord)

