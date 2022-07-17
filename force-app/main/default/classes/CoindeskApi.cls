public class CoindeskApi {
    @AuraEnabled
    public static JsonParser coinbaseAPimethod(){
		 String verphoneEndPoint = 'https://api.coindesk.com/v1/bpi/currentprice.json';
        //Http
        Http http = new Http();
	   //HttpRquest
        HttpRequest req = new HttpRequest();
        req.setEndpoint(verphoneEndPoint);
        req.setMethod('GET');
        req.setTimeout(60000);
        //HttpResponse
        HTTPResponse res = http.send(req);
        String responseBody = res.getBody();
        System.debug('****PhoneVerificationApi'+responseBody);

        
        JsonParser reponseWrap = (JsonParser)JSON.deserialize(responseBody, JsonParser.class);
        System.debug('****PhoneVerificationApi'+reponseWrap);
        return reponseWrap;
		
  }
}