set sel [atomselect 1 "protein"]
set com [measure center $sel]
set sum 0
foreach coord [$sel get {x y z}] {
	set sum [vecadd $sum [veclength2 [vecsub $coord $com]]]
				}
return [expr sqrt($sum/[$sel num])]
#vecsub-vector substraction
#veclenght2=find out the length and square it.
#vecadd=vector addition
#$sel num-Find out number of entries in $sel

