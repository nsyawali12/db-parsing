/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sbdparsingv2;

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
 * @author N. Syawali. A
 */
public class SbdParsingV2 {

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
          BufferedReader readData = new BufferedReader(new FileReader("src/sbdparsingv2/pemesananTravel.csv"));
          data = readData.readLine();
        } catch (FileNotFoundException ex){
          Logger.getLogger(SbdParsingV2.class.getName()).log(Level.SEVERE, null, ex);
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
                      for(int i = 0; i < selectData1 - 1; i++){
                        ArrayT.add(insert_input[i+1]);
                      }
                      listSelect1 = new String[ArrayT.size()];
                      ArrayT.toArray(listSelect1);

                      boolean sTable1 = false;
                      boolean sTable2 = false;
                      //sTable = status Tabel

                      int i = 0;
                      while (i < csvResult.length && !sTable1) {
                        if(csvResult[i].contains(insert_input[inFrom+1])){
                          sTable1 = true;
                        }
                        i++;
                      }
                      i = 0;
                      while (i < csvResult.length && !sTable2){
                        if(csvResult[i].contains(insert_input[inJoin+1])){
                          sTable2 = true;
                        }
                        i++;
                      }

                      if(!sTable1 || !sTable2){
                        System.out.println("Tabel yang anda masukkan tidak terdaftar");
                      }

                      boolean statData = false;
                      i = 0;
                      int count = 0;
                        //mengeluarkan hasil CSV dan List data yang dipilih

                      while(i < listSelect1.length-1){
                        int j = 0;
                        boolean temp2 = false;
                        while(j < csvResult.length && !temp2){
                          if(csvResult[j].contains(listSelect1[i])){
                            if(csvResult[j].contains(insert_input[inFrom+1]) || csvResult[j].contains(insert_input[inJoin+1])){
                                count++;
                            }
                          }
                          j++;
                        }
                        i++;
                      }

                      //print count;
                      //print status date sTable1
                      //print status dari sTable2

                      if(count == listSelect1.length && sTable1 && sTable2){
                        String res1 = ""; //result 1
                        String res2 = ""; //result 2
                        for(int z = 0; z < listSelect1.length; z++){
                          for(int y = 0; y < csvResult.length; y++){
                            if(csvResult[y].contains(insert_input[inFrom+1]) && csvResult[y].contains(listSelect1[z])){
                              res1 = res1 + listSelect1[z] + ", ";
                            }
                            if(csvResult[y].contains(insert_input[inJoin+1]) && csvResult[y].contains(listSelect1[z])){
                              res2 = res2 + listSelect1[z] + ", ";
                            }
                          }
                        }

                        //output hasil 1 dari res 1 dimana res1 menggunakan from
                        //output hasil 2 dari res 2 dimana res2 menggunakan Join
                        System.out.println("Hasilnya adalah");
                        System.out.println("Tabel 1: " + insert_input[inFrom+1]);
                        System.out.println("Kolom: "+ res1);
                        System.out.println("Tabel 2: " + insert_input[inJoin+1]);
                        System.out.println("Kolom: "+ res2);
                      }
                    } else {
                      System.out.println("Perbedaan pada kolom, Query Error!");
                    }

                  } else {
                    System.out.println("Querry Error karena 'On' tidak dapat ditemukan");
                  }
                } else {
                    String fromName = insert_input[inFrom+1];
                    int selectData1 = inFrom;
                    String[] listSelect1 = null;
                    List<String> ArrayT = new ArrayList<String>();
                    for(int i=0; i < selectData1 - 1; i++){
                      ArrayT.add(insert_input[i+1]);
                    }
                    listSelect1 = new String[ArrayT.size()];
                    ArrayT.toArray(listSelect1);

                    boolean sSTable = false; //status Semua sTable
                    int i = 0;
                    while(i < csvResult.length && !sSTable){
                      if(csvResult[i].contains(insert_input[inFrom+1])){
                        sSTable = true;
                      }
                      i++;
                    }
                    if (!sSTable){
                        System.out.println("Tabel tidak terdaftar");
                    }

                    boolean sData = false;
                    i=0;
                    int count = 0;

                    //nantinya akan mengoutputkan hasil panjang data csvResult

                    while(i<listSelect1.length && !sData){
                      int j = 0;
                      boolean temp2 = false;
                      while(j < csvResult.length && !temp2){
                        if(csvResult[j].contains(listSelect1[i])){
                          if(csvResult[j].contains(insert_input[inFrom+1])){
                            count++;
                          }
                        }
                        j++;
                      }
                      i++;
                    }
                    //output si count nya
                    if(count == listSelect1.length && sSTable){
                      String result = "";
                      for(int z=0; z < count; z++){
                        result = result + listSelect1[z] + ", ";
                      }
                      System.out.println("Tabel: "+ insert_input[inFrom+1]);
                      System.out.println("Kolom: "+ result);
                    } else {
                      System.out.println("Query Error");
                    }
                }
              } else {
                System.out.println("Query Error, karena 'from' tidak dapat terdeteksi");
              }
            } else {
              System.out.println("Query Error karena anda memasukkan format Query yang salah!");
            }

          } else {
            System.out.println("Query Not Found");
          }

        } else {
          System.out.println("Query Error karena 'Select' tidak ditemukan ");
        }

    }
    
}
