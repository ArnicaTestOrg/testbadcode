//Another test
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class VulnerableSSRF {
public static void main(String[] args) {
try {
// Get user-input URL
System.out.print("Enter URL: ");
BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
String inputURL = reader.readLine();

// Fetch and display content from the provided URL
URL url = new URL(inputURL);
BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
String inputLine;
while ((inputLine = in.readLine()) != null) {
System.out.println(inputLine);
}
in.close();
} catch (Exception e) {
e.printStackTrace();
}
}
}
