package travels;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;

public class test {
	public static void main(String[] args) {

		httpClient httpClient = HttpClientBuilder.create().build(); // Use this
																	// instead

		try {

			HttpPost request = new HttpPost("http://yoururl");
			StringEntity params = new StringEntity("details={\"name\":\"myname\",\"age\":\"20\"} ");
			request.addHeader("content-type", "application/x-www-form-urlencoded");
			request.setEntity(params);
			HttpResponse response = httpClient.execute(request);

			// handle response here...

		} catch (Exception ex) {

			// handle exception here

		} finally {
			// Deprecated
			// httpClient.getConnectionManager().shutdown();
		}
	}
}
