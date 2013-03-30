set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'commits_by_author.png'
set key left top
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Commits"
set xtics rotate
set bmargin 6
plot 'commits_by_author.dat' using 1:2 title "Xavier Shay" w lines, 'commits_by_author.dat' using 1:3 title "adamwong246" w lines, 'commits_by_author.dat' using 1:4 title "Jason Cheow" w lines, 'commits_by_author.dat' using 1:5 title "Adam Wong" w lines, 'commits_by_author.dat' using 1:6 title "Gaelian Ditchburn" w lines, 'commits_by_author.dat' using 1:7 title "Zach Inglis" w lines, 'commits_by_author.dat' using 1:8 title "Gabriel Evans" w lines, 'commits_by_author.dat' using 1:9 title "Chris Lloyd" w lines, 'commits_by_author.dat' using 1:10 title "Adam Wróbel" w lines, 'commits_by_author.dat' using 1:11 title "Ben Hamill" w lines, 'commits_by_author.dat' using 1:12 title "Tim Lucas" w lines, 'commits_by_author.dat' using 1:13 title "Rob Caporetto" w lines, 'commits_by_author.dat' using 1:14 title "Prabin Deka" w lines, 'commits_by_author.dat' using 1:15 title "Paul Dowman" w lines, 'commits_by_author.dat' using 1:16 title "Gareth Townsend" w lines, 'commits_by_author.dat' using 1:17 title "Ben Somers" w lines, 'commits_by_author.dat' using 1:18 title "AkitaOnRails" w lines, 'commits_by_author.dat' using 1:19 title "Adam Wróbel" w lines, 'commits_by_author.dat' using 1:20 title "Pedro Del Gallego" w lines, 'commits_by_author.dat' using 1:21 title "Mark Gulbrandsen" w lines
