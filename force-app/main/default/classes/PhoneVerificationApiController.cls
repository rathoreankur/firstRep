// Called From FLow
public class PhoneVerificationApiController {
	@InvocableMethod (label='Verify Moblie No' description='Makes Api Call to PhoneVerification API' )
	public static List<Boolean> verifyphoneNumber(List<String> phonenumbers) {
	PhoneVerificationApi.PhoneValidateResponseWrapper  phoneresponse  = PhoneVerificationApi.validatePhoneNumber(phonenumbers[0]);
	return new List<Boolean>{phoneresponse.phone_valid};
  }
}
/*public class PhoneVerificationApiController {
    @future(callout=true)
	public static void verifyphoneNumber(String phone) {
   	system.debug('phoneresponsefutur'+phone);

	PhoneVerificationApi.PhoneValidateResponseWrapper  phoneresponse  = PhoneVerificationApi.validatePhoneNumber(phone);
	system.debug('phoneresponsefutur'+phoneresponse);
  }
}*/