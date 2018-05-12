package br.com.fatecpggrupo1;
import java.util.ArrayList;
public class BD {
    
    private static ArrayList<Usuario> usuarios;
    private static ArrayList<Usuario> top10;

    public static ArrayList<Usuario> getUsuarios() {
        if (usuarios==null) {
            usuarios = new ArrayList<>();
        }
        return usuarios;
    }
    
        public static ArrayList<Usuario> getTop10() {
        if (top10==null) {
            top10 = new ArrayList<>();
        }
        return top10;
    }
    

     
}