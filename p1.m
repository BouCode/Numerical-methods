l_1 = input ("Inserte lado 1: \n");
l_2 = input ("Inserte lado 2: \n");
l_3 = input ("Inserte lado 3: \n");

dif = abs (l_1 - l_2);
sum = l_1 + l_2;

if (dif < l_3 && l_3 < sum)
    printf ('Existe el triangulo\n');
else
    printf ('No existe el triangulo\n');
endif


