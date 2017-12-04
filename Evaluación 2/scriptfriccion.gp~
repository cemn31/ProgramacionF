set title "Trayectoria Movimiento de Protectiles con Resistencia del Aire"
set title font ",15" norotate
set xlabel "Alcance Horizontal"
set xlabel font "Verdana,12"
set ylabel "Alcance Vertical"
set ylabel font "Verdana,12"
set style data points
set xrange [0:3.5]
set yrange [0:1.5]
set pointsize 0.4
plot "friccion.dat" index 0 using 2:3  with linespoints ls 5 title "Vo = 2",\
"friccion.dat" index 1 using 2:3  with linespoints ls 6 title "Vo = 4",\
 "friccion.dat" index 2 using 2:3  with linespoints ls 7 title "Vo = 6",\
"friccion.dat" index 3 using 2:3  with linespoints ls 8 title "Vo = 8",\
 "friccion.dat" index 4 using 2:3  with linespoints ls 9 title "Vo = 10"
