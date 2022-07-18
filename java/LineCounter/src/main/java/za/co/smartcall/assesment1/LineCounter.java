package za.co.smartcall.assesment1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;

public class LineCounter {
	private static String HOME = System.getProperty("user.home");

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	/**
	 * Return the number of actual java lines in the file
	 * Comment start sequences that appear inside Java strings should be ignored.
	 * Empty space is ignored
	 * @param uri URI of the file analysed
	 * @return return the number of actual java lines in the file
	 * @throws IOException
	 */

	public int calculateLinesInFile(URI uri) throws IOException {
		Path path = Paths.get(uri);
		List<String> read = Files.readAllLines(path);

		//TODO 1 the logic to calculate the number of actual lines containing code
	          try {
                     int[]iarr ={0}; //used iarr to store the total lines of code.
                    read.forEach(temp->{ //looping through all lines of code lookng for the actual code lines
                        if(temp.contains("{")||temp.contains("}")||temp.contains(";")||temp.contains("class") )
                        {
                         iarr[0]++;
                        }
                    });

                    return iarr[0];
                  }
                  catch (Exception e){
                  System.out.println("Something went wrong reading the file, trying another method");
                  }

		//TODO 2 the method to read in the lines above crashes with very large files how would solve this?
		// I used same logic to check the lines with code but changed the method of reading the file in case the file really big
           try (Stream inputStream = Files.lines(path, StandardCharsets.UTF_8)) {
                 BufferedReader r = new BufferedReader(new InputStreamReader((InputStream) inputStream));

                 String line;
                 while((line=r.readLine()) !=null){
                 int[]iarr ={0}; //used iarr to store the total lines of code
                    read.forEach(temp->{ //looping through all lines of code lookng for the actual code lines
                        if(line.contains("{")||line.contains("}")||line.contains(";")||line.contains("class") )
                        {
                         iarr[0]++;
                        }
                    });

                    return iarr[0];
                 }



           }
		throw new IllegalArgumentException("Not implemented yet");
	}

}
