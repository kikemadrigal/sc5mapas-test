/*
		Csv2bin  utility by Bitvision Software 2019

*/

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Collections;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author G7797216
 */
public class Csv2bin {

    
    static String binaryOutputFile;
    static BufferedReader in;
    

    static boolean reverse = false;
    static boolean ymirror = false;
 
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        
        
        if (!(args.length==2 || args.length==3) ) {
            System.out.println("Csv2bin <-r|-ym> <file.csv> <file.out>");
	    System.out.println("-r is reverse mode on");
            System.out.println("-ym is y axis mirror mode on");
            System.out.println("Example:");
            System.out.println("Csv2bin whatever.csv whatever.bin");
            System.exit(1);
        }
        
        //out = new BufferedWriter(new FileWriter(Paths.get(args[1]).toString()));
	if (args.length==2) {
        	binaryOutputFile = args[1];
        	in = new BufferedReader(new FileReader(Paths.get(args[0]).toString()));
	} else {
        	binaryOutputFile = args[2];
        	in = new BufferedReader(new FileReader(Paths.get(args[1]).toString()));
		
                if (args[0].equalsIgnoreCase("-r")) {
                    reverse = true;
                } else 
                if (args[0].equalsIgnoreCase("-ym")) {
                    ymirror = true;
                }
                    
                
	}

        
        new Csv2bin();
        
        
    }

    public Csv2bin() throws IOException {
    
        String line = null;
        List<Byte> allBytesInFile = new ArrayList<Byte>();
        while ((line = in.readLine()) != null) {
            line = line.trim();
            StringTokenizer strTkn = new StringTokenizer(line, ",");
            while (strTkn.hasMoreTokens()){
                String str = strTkn.nextToken().trim();
                ByteBuffer b = ByteBuffer.allocate(4);
                b.putInt(Integer.parseUnsignedInt(str));
                byte[] byteArray = b.array();
                //allBytesInFile.add(byteArray[2]);
                allBytesInFile.add(byteArray[3]);
            }
        }
        //done

	Path path = Paths.get(binaryOutputFile);
	if (reverse) {
		Collections.reverse(allBytesInFile);
                allBytesInFile.remove(0);
                List<Byte> allBytesInFile2 = new ArrayList<Byte>();
                for (int i=0 ; i<allBytesInFile.size(); i=i+2){
                    //swap
                    allBytesInFile2.add(allBytesInFile.get(i+1));
                    allBytesInFile2.add(allBytesInFile.get(i));
                }
                allBytesInFile2.add(new Byte("-1"));
                allBytesInFile= allBytesInFile2;
	} else 
	if (ymirror) {
                allBytesInFile.remove(allBytesInFile.size()-1);//remove #ff
                List<Byte> allBytesInFile2 = new ArrayList<Byte>();
                for (int i=0 ; i<allBytesInFile.size(); i=i+2){
                    //swap
                    Byte b = (byte)(255 - allBytesInFile.get(i)); //x=255-x; //mirror
                    allBytesInFile2.add(b);
                    allBytesInFile2.add(allBytesInFile.get(i+1));//same y
                }
                allBytesInFile2.add(new Byte("-1"));
                allBytesInFile= allBytesInFile2;
	}            
        
        
       	 Files.write(path, toPrimitives(
          (Byte[])allBytesInFile.toArray(new Byte[]{})
         )
       	);
			
    
    }
    
    
    private byte[] toPrimitives(Byte[] oBytes)
    {
        byte[] bytes = new byte[oBytes.length];

        for(int i = 0; i < oBytes.length; i++) {
            bytes[i] = oBytes[i];
        }

        return bytes;
    }
    
}
