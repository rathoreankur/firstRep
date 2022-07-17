trigger callFlow on Account (after insert) {
// Call the Flow
Map<String, Object> params = new Map<String, Object>();


 params.put('varR_Accounts',trigger.new);


 
System.debug('helloWorldFlow'+params);

Flow.Interview.Retun_Recorrd_Count helloWorldFlow = new Flow.Interview.Retun_Recorrd_Count(params);
helloWorldFlow.start();
 
// Obtain the results

Decimal returnValue = (Decimal) helloWorldFlow.getVariableValue('count');
String returnValue1 = (String) helloWorldFlow.getVariableValue('testxt');

System.debug('Flow returned ' + returnValue);
System.debug('Flow returned ' + returnValue1);



}