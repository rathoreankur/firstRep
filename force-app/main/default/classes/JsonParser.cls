public class JsonParser{
		@AuraEnabled public String chartName{get;set;}
		@AuraEnabled public String disclaimer{get;set;}
		@AuraEnabled public bpi bpi{get;set;}
		@AuraEnabled public times tme{get;set;}
	public class USD{
		@AuraEnabled public String code{get;set;}
		@AuraEnabled public String symbol{get;set;}
		@AuraEnabled public String rate{get;set;}
		@AuraEnabled public Decimal rate_float{get;set;}
		@AuraEnabled public String description{get;set;}
	}
	public class times{
		@AuraEnabled public String updateduk{get;set;}
		@AuraEnabled public String updatedISO{get;set;}
		@AuraEnabled public String updated{get;set;}
	}
	public class GBP{
		@AuraEnabled public String code{get;set;}
		@AuraEnabled public String description{get;set;}
		@AuraEnabled public String rate{get;set;}
		@AuraEnabled public Decimal rate_float{get;set;}
		@AuraEnabled public String symbol{get;set;}
	}
	public class EUR{
		@AuraEnabled public String code{get;set;}
		@AuraEnabled public String rate{get;set;}
		@AuraEnabled public String description{get;set;}
		@AuraEnabled public String symbol{get;set;}
		@AuraEnabled public Decimal rate_float{get;set;}
	}
	public class bpi{
		@AuraEnabled public GBP GBP{get;set;}
		@AuraEnabled public EUR EUR{get;set;}
		@AuraEnabled public USD USD{get;set;}
	}
}