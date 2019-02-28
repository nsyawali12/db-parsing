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

        // System.out.println(doubleSpasi2);

        String[] inp = doubleSpace2.split(" "); //memecahkan inputan

    }

}
