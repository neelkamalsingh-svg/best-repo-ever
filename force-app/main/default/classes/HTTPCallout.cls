public class HTTPCallout { 

Public string Entername {set; get;} 
Public string nameresult {set; get;} 
Public list<Object> animallist {set; get;} 

public class jsonWrapper { 
public String name {get; set;} 
public String clientSecret {get; set;} 
} 

public void doHTTPPOST() { 
    List<String> Animalsstring = new List<String>(); 
    Http http = new Http(); 
    HttpRequest request = new HttpRequest(); 
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); 
    request.setMethod('POST'); 
    request.setHeader('Content-Type', 'application/json;charset=UTF-8'); 
    // Set the body as a JSON object 
    if(Entername==null ||Entername=='' ) { 
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter value')); 
    } else { 
        jsonWrapper wrap = new jsonWrapper(); 
        wrap.name=Entername; 
        String jsonBody = json.serialize(wrap); 
        request.setbody(jsonBody); 
    } 

    //request.setBody(('{"name":"Neel kumar"}')); 
    HttpResponse response = http.send(request); 
    // Parse the JSON response 
    if (response.getStatusCode() != 201) { 
        System.debug('The status code returned was not expected: ' + 
        response.getStatusCode() + ' ' + response.getStatus()); 
    } else { 
        System.debug(response.getBody()); 
        nameresult=response.getBody(); 
    } 
} 
Public void doHTTPGET() { 
    Http http = new Http(); 
    HttpRequest request = new HttpRequest(); 
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); 
    request.setMethod('GET'); 
    HttpResponse response = http.send(request); 
    // If the request is successful, parse the JSON response. 
    if (response.getStatusCode() == 200) { 
        nameresult=response.getBody(); 
        // Deserialize the JSON string into collections of primitive data types. 
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody()); 
        // Cast the values in the 'animals' key as a list 
        List<Object> animals = (List<Object>) results.get('animals'); 

    for ( Object animal: animals ) { 
        System.debug('Received the following animals:' +animal); 
    } 
   } 
} 

Public void GetWeatherMap() { 
    Http http = new Http(); 
    HttpRequest request = new HttpRequest(); 
    request.setEndpoint('https://api.openweathermap.org/data/2.5/forecast?id=1269843&APPID=b1dfd60a3e40c011f623e1fb1436617e '); 
    request.setMethod('GET'); 
    HttpResponse response = http.send(request); 
// If the request is successful, parse the JSON response. 
    if (response.getStatusCode() == 200) { 
        String httpstring=response.getBody(); 
        nameresult= httpstring.substringAfter('city":'); 
        System.debug('Received the following animals:'+nameresult); 
    } else if (response.getStatusCode() != 201) { 
        System.debug('The status code returned was not expected: ' + 
        response.getStatusCode() + ' ' + response.getStatus()); 
    }     
   } 
}