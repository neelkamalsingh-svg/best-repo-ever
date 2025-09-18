@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse  response_x = 
            new ParkService.byCountryResponse();
              String tempReturn='Hamburg Wadden Sea National Park, Hainich National Park, Bavarian Forest National Park';
               
        response_x.return_x = tempReturn.split(',');
        // end
        response.put('response_x', response_x); 
   }
}