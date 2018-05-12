/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpggrupo1;

import java.util.Comparator;

/**
 *
 * @author Pecora
 */
public class DataComparator implements Comparator {
    public int compare(Usuario u1, Usuario u2){
    return u1.getDataTeste().compareTo(u2.getDataTeste());
    }

    @Override
    public int compare(Object o1, Object o2) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
