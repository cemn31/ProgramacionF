set title "Trayectoria de la tierra y la luna alrededor del sol"
set title font ",15" norotate
set style data lines
set style data points
set pointsize 0.5
unset key
unset border
unset xtics
unset ytics
set xrange [-165023000:165023000]
set yrange [-165023000:165023000]
set label 1 "Sol" at 0.0,0.0 center front
set label 2 "Perihelio" at 111600000.00000000, 0.0000000000000000
set label 3 "Afelio" at -141599999.99996805, 97.777033044205780
plot "tr_luna_tierra.txt" using 1:2 ls 1 lw 1 lc rgb "gray",\
"tr_luna_tierra.txt" using 3:4 ls 1 lw 1 lc rgb "blue",\
"pst_tierra.txt" using 1:2 ls 6 lw 10 lc rgb "red",\
"center.txt" using 1:2 ls 6 lw 24 lc rgb "yellow"
