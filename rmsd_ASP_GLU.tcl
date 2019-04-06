set ref_fit [atomselect 0 "protein"]
set ref_rms [atomselect 0 "resname ASP GLU and type CB CG CD OD1 OD2 OE1 OE2"]
set out_file [open "rmsd_ASP_GLU_sidechain_fr_CS.dat" w]

set n_frames [molinfo 1 get numframes]
for {set frame 0} {$frame < $n_frames} {incr frame} {
	#get correct frame
	molinfo top set frame ${frame}
	set com_fit [atomselect 1 "protein"]
	set trans_mat [measure fit $com_fit $ref_fit]
	$com_fit move $trans_mat
	set com_rms [atomselect 1 "resname ASP GLU and type CB CG CD OD1 OD2 OE1 OE2"]
	set rmsd [measure rmsd $com_rms $ref_rms]
	puts $out_file "$frame $rmsd"
	flush $out_file
}
