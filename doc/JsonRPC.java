// depends on http://software.dzhuvinov.com/download.html#download-jsonrpc2base and the client
import com.thetransactioncompany.jsonrpc2.client.*;
import com.thetransactioncompany.jsonrpc2.*;
import java.net.*;
import java.util.*;

public class JsonRPC {

  public static void main(String[] args) {

  URL serverURL = null;

  try {
    serverURL = new URL("http://127.0.0.1:8999");

  } catch (MalformedURLException e) {
    System.err.println(e.getMessage());
  }

  JSONRPC2Session mySession = new JSONRPC2Session(serverURL);

  mySession.getOptions().setRequestContentType("text/html");
  mySession.getOptions().setAllowedResponseContentTypes(new String[]{"text/html"});

  List params = new ArrayList<Integer>();
  params.add(1);
  params.add(2);
  params.add(3);

  JSONRPC2Request request = new JSONRPC2Request("sum", params, 0);

  JSONRPC2Response response = null;

  try {
    response = mySession.send(request);
  } catch (JSONRPC2SessionException e) {
    System.err.println(e.getMessage());
  }

  if (response.indicatesSuccess())
    System.out.println(response.getResult());
  else
    System.out.println(response.getError().getMessage());

  }
}
