public class AnimalLocator {
    public class cls_animal{
        public string id;
        public string name;
        public string eats;
        public string says;
    }
    public class JSONOutput{
	public cls_animal animal;

   	//public JSONOutput parse(String json){
	//return (JSONOutput) System.JSON.deserialize(json, JSONOutput.class);
	//}
} 
    public static string getAnimalNameById(Integer i){
      Http http = new http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        req.setMethod('GET');
        HttpResponse response = http.send(req);
           
        JSONOutput results = (JSONOutput)JSON.deserialize(response.getBody(),JSONOutput.class);
        System.debug('Received the following animals:'+results.animal.name);
       
        
        return results.animal.name ;
    }
}