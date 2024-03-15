function StoreFractions() {
	//Re apply fractions
	hsp += hsp_f;
	vsp += vsp_f;

	//Store and Remove fractions
	hsp_f = frac(hsp);
	hsp -= hsp_f;
	vsp_f = frac(vsp);
	vsp -= vsp_f;

	//Note to self, whenever changing speeds directly, also clear fraction.


}
