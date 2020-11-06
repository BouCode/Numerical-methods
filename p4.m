printf(['\tf\t\t','g\t\t','h\t\t','p\n'])
for a = 2:1:6
    f = log (10*a);
    g = f * sin (10*a);
    h = f + g;
    p = f - g;
    fprintf (['\t\b\b\b%+d\t', '\t\b\b\b%+d\t', '\t\b\b\b%+d\t', '\t\b\b\b%+d\t\n'], f, g, h, p)
endfor


