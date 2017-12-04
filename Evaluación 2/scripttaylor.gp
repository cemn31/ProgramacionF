set title "Aproximación de la función exp(x) por la serie de Maclaurin"
set title font ",15" norotate
set xlabel "Eje x"
set xlabel font "Verdana,12"
set ylabel "Eje y"
set ylabel font "Verdana,12"
set key left
set style data points
set xrange [0:10]
set yrange [0:23000]
set pointsize 0.4
plot "exp_taylor.txt" index 0 using 1:2  with linespoints ls 4 title "exp(x)",\
"exp_taylor.txt" index 0 using 1:3  with linespoints ls 5 title "Aprox. 1",\
"exp_taylor.txt" index 1 using 1:3  with linespoints ls 6 title "Aprox. 2",\
"exp_taylor.txt" index 2 using 1:3  with linespoints ls 7 title "Aprox. 3",\
"exp_taylor.txt" index 3 using 1:3  with linespoints ls 8 title "Aprox. 4",\
"exp_taylor.txt" index 4 using 1:3  with linespoints ls 9 title "Aprox. 5",\
"exp_taylor.txt" index 5 using 1:3  with linespoints ls 1 title "Aprox. 6",\
"exp_taylor.txt" index 6 using 1:3  with linespoints ls 2 title "Aprox. 7",\
"exp_taylor.txt" index 7 using 1:3  with linespoints ls 3 title "Aprox. 8"
