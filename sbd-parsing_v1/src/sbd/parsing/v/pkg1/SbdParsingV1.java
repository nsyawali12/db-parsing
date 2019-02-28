/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sbd.parsing.v.pkg1;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Syawali.A
 */
public class SbdParsingV1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here

        System.out.println("Hello World!");

        //readf = variabel baru untuk scanner
        Scanner readf = new Scanner(System.in);
        System.out.print("Input Query: ");
        String inp = readf.nextLine();

        //variabel - variabel menampung sysmbol

        String errorC1 = inp.replace(";;", "!");
        String errorC2 = errorC1.replace(",,", "~");

        String comma = errorC2.replace(",", " ");
        String kurbuk = comma.replace("(", " ");
        String kurtup = kurbuk.replace(")", " ");
        String point = kurtup.replace(".", " ");
        String same = point.replace("=", " ");
        String semicolon = same.replace(";", " ");
        String doubleSpace = semicolon.replace("  ", " ");
        String doubleSpace2 = doubleSpace.replace("  ", " ");

        // System.out.println(doubleSpace2);

        String[] insert_input = doubleSpace2.split(" ");
        //Memisahkan si data dari file csv menjadi sebuahh
        // atau beberapa element array

        String data = "";
        try {
          BufferedReader readData = new BufferedReader(new FileReader("src/sbd/parsing/v/pkg1/pemesananTravel.csv"));
          data = readData.readLine();
        } catch (FileNotFoundException ex){
          Logger.getLogger(SbdParsingV1.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Hasil data dari parsing CSV
        String[] csvResult = data.split("#");


        int inFrom = 0; //indexFrom menandakan index darimana keberapa
        int inJoin = 0; //indexJoin menandakan index yang mengalami Inner Join
        int inOn = 0; //IndexOn menandakan index sekarang

        if("select".equalsIgnoreCase(insert_input[0])){ //Mengecek apakah query diawali dengan select
          if(";".equalsIgnoreCase(insert_input[insert_input.length-1])){ // ";" untuk mengecek inputan user diakhiri dengan ";" atau tidak, jika tidak maka akan memberikan warning!
            Boolean sError = false; //status Error
            Boolean sFrom = false; //status from
            Boolean sJoin = false; //status Join
            Boolean sOn = false; //status On

            for(int i = 0; i < insert_input.length - 1; i++){
              if("!".equals(insert_input[i])){
                sError = true;
              }

              if("from".equalsIgnoreCase(insert_input[i]) && !sFrom){
                sFrom = true;
                inFrom = i;
              }

              if("join".equalsIgnoreCase(insert_input[i]) && !sJoin){
                sJoin = true;
                inJoin = i;
              }

              if("on".equalsIgnoreCase(insert_input[i]) && !sOn){
                sOn = true;
                inOn = i;
              }
            }

            if(!sError){
              if("from".equalsIgnoreCase(insert_input[inFrom])){
                if("join".equalsIgnoreCase(insert_input[inJoin]) && inJoin != 0){
                  if("on".equalsIgnoreCase(insert_input[inOn])){ // tulis sintak query, misal "Select From"
                    String nameFrom = insert_input[inFrom + 1];
                    String nameJoin = insert_input[inJoin + 1];

                    //nntinya akan menampilkan from dan join dari Query

                    if(insert_input[inOn + 2].equals(insert_input[inOn + 4])){
                      int selectData1 = inFrom;
                      String[] listSelect1 = null;
                      List<String> ArrayT = new ArrayList<String>(); //ArrayT = Temporary Array
                    }

                  }
                }
              }
            }
          }
        }

    }

}
