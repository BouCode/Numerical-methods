function p2 (l_1, l_2, l_3)
    dif = abs (l_1 - l_2);
    sum = l_1 + l_2;

    if (dif < l_3 && l_3 < sum)
        printf ('Existe el triangulo\n')
    else
        printf ('No existe el triangulo\n')
    endif
endfunction
