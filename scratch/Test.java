import java.net.*;
public class Test {
    public static void main(String[] args) throws Exception {
        String[] hosts = {"dl.google.com", "repo.maven.apache.org", "plugins.gradle.org"};
        for (String h : hosts) {
            System.out.println("--- " + h + " ---");
            for (InetAddress a : InetAddress.getAllByName(h)) {
                System.out.println(a);
            }
            try {
                Socket s = new Socket();
                s.connect(new InetSocketAddress(h, 443), 3000);
                System.out.println("SUCCESS connected to: " + s.getRemoteSocketAddress());
                s.close();
            } catch (Exception e) {
                System.out.println("FAILED: " + e);
            }
        }
    }
}
