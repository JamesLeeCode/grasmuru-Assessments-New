package za.co.smartcall;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.Arrays;
import java.util.function.Function;
import java.util.stream.Collectors;





public class CollectionUtilities {
	
	record NetworkCount(long count) implements Comparable<NetworkCount>{

		@Override
		public int compareTo(NetworkCount o) {
			return Long.compare(this.count,o.count);
		}
		
	}
	
	
    record NetworkName(String network) {
		
	}
    
	
	/**
	 * Parse the json content from the URI into the Network, Product and ProductTypes
	 * Please dont modify the records. We have left a libraries in the maven file for when we did it 
	 * Try use Functional paradigms if possible to keep code simple
	 * @param uri
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static Networks parseJsonFile(URI uri) throws FileNotFoundException, IOException {
		//TODO 1
                  ArrayList<Network> result = new ArrayList<Network>();

        try{
            String text = new String(Files.readAllBytes(Paths.get(uri)), StandardCharsets.UTF_8);

            JSONObject obj = new JSONObject(text);
            JSONArray arr = obj.getJSONArray("networks");

            for(int i = 0; i < arr.length(); i++){
                String id = arr.getJSONObject(i).getString("id");
                String description = arr.getJSONObject(i).getString("description");
                JSONArray cars = arr.getJSONObject(i).getJSONArray("productTypes");
                result.add(new Network(id, description, JSONArray));
            }           
        }
        catch(Exception ex){
            System.out.println(ex.toString());
        }
        return result;
		
	}
	

	
	/**
	 * Histogram of Network and the occurrence of Products
	 * @param networks class
	 * @return a Map of network name and associated count as record
	 * Hint: Credit is given to candidates using Collectors groupingBy in the stream API
	 */
	public static Map<NetworkName,NetworkCount> returnAMapOfEachNetworkAndNumberOfProducts(Networks networks){
	     //TODO 2
              
               Map<String, Long> counting = networks.stream().collect(
                Collectors.groupingBy(networks::description, Collectors.counting()));

		return counting;
	}

	/**
	 * Return only products for vodacom
	 * @param networks
	 * @return
	 * Hint: To get started, try use streams with flatMaps
	 */
	public static List<Product> returnAllProductsThatAreVodacom(Networks networks){
		//TODO 3
		return null;
	}
	
}
