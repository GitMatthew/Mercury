package com.corso.model;

import java.util.ArrayList;

public class CascataDiDiamanti<T>
{
	
	@SuppressWarnings("unchecked")
	public ArrayList<String> dammiID(ArrayList<T> x, int cosa)
	{
		
		ArrayList<String> rit = new ArrayList<String>();
		ArrayList<Provincia> p = new ArrayList<Provincia>();
		ArrayList<Comune> c = new ArrayList<Comune>();
		
		if (cosa == 1) {
			p = (ArrayList<Provincia>) x;
			
			for (Provincia j : p) {
				
				rit.add(String.valueOf(j.getId_provincia()));
			}
			
		}
		else if (cosa == 2) {
			for (T j : x) {
				
				rit.add(String.valueOf(((Comune) j).getId_comune()));
			}
			
		}
		
		return rit;
		
	}
	
	public ArrayList<String> dammiNOME(ArrayList<T> x, int cosa)
	{
		
		ArrayList<String> rit = new ArrayList<String>();
		
		ArrayList<Provincia> p = new ArrayList<Provincia>();
		ArrayList<Comune> c = new ArrayList<Comune>();
		
		if (cosa == 1) {
			for (T j : x) {
				
				rit.add(((Provincia) j).getNome_provincia());
			}
		}
		else if (cosa == 2) {
			
			for (T j : x) {
				
				rit.add(((Comune) j).getNome_comune());
			}
			
		}
		
		return rit;
		
	}
	
}
