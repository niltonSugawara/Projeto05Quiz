/*
 * Pacote de Perguntas do Quiz
 */
package br.com.fatecpggrupo1;
import java.util.ArrayList;
/**
 * @author nilsonli
 */
public class Quiz {
     private static ArrayList<Question> test;
    public static ArrayList<Question> getTest(){
        if(test == null){
            test = new ArrayList<>();
            test.add(new Question("01 - Em 2009, quem era o presidente do Brasil","Lula", new String[]{"Molusco", "Lula","Polvo"}));
            test.add(new Question("02 - Complete a frase: O rato roeu a roupa do Rei...","de Roma", new String[]{"de Roma", "da Espanha","da Inglaterra"}));
            test.add(new Question("03 - Quem nasce na cidade de São Paulo e´?","paulistano", new String[]{"paulista", "são-paulino","paulistano"}));
            test.add(new Question("04 - Quem é mundialmente conhecido como Rei do Futebol?","Pelé", new String[]{"Pelé", "Maradona","Roberto Carlos"}));
            test.add(new Question("05 - Qual o nome do brasileiro conhecido como Pai da Aviação","Alberto Santos Dumont", new String[]{"Alberto Santos Dumont", "Osvaldo Cruz","Rui Barbosa"}));
            test.add(new Question("06 - Qual continente se localiza o Egíto?","Africano", new String[]{"Asiático", "Europeu","Africano"}));
            test.add(new Question("07 - A capital da China é conhecida por dois nomes. Você sabe quais?","Pequim e Beijing", new String[]{"Taiwan e Macau", "Pequim e Taiwan","Pequim e Beijing"}));
            test.add(new Question("08 - Quem nasce na cidade de Salvador, no estado da Bahia, é chamado de:","Soteropolitano", new String[]{"Salvadorenho", "Soteropolitano","Salvadorano"}));
            test.add(new Question("09 - O monumento denominado Arco do Triunfo situa-se me qual cidade?","Paris", new String[]{"Roma", "Londres","Paris"}));
            test.add(new Question("10 - O dia da Bandeira é comemorado em:","19 de Novembro", new String[]{"19 de Novembro", "07 de Setembro","15 de Novembro"}));
        }
        return test;
        
    }
}
