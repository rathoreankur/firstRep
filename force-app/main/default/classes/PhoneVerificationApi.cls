public class PhoneVerificationApi {
    public static PhoneValidateResponseWrapper validatePhoneNumber(String phone){
        system.debug(phone);
         String apikey = '26578F7AC44442399A69AC7604D0117E';
        
		 String verphoneEndPoint = 'https://api.veriphone.io/v2/verify?phone='+phone+'&key='+apikey;
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
        
        PhoneValidateResponseWrapper reponseWrap = (PhoneValidateResponseWrapper)JSON.deserialize(responseBody, PhoneValidateResponseWrapper.class);
        System.debug('****PhoneVerificationApi'+reponseWrap);
        return reponseWrap;
        

    }
    
    
    
    
    
    
    
    
    
    
    
    public class PhoneValidateResponseWrapper{
        public String status;
        public String phone;
        public Boolean phone_valid;
        public String phone_type;
        public String region;
        public String country;
        public String country_code;
        public String country_prefix;
        public String international_number;
        public String local_number;
        public String e164l;
        public String carrier;
    }
}