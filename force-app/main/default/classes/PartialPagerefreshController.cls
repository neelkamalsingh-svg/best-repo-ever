public class PartialPagerefreshController{
public integer value {get; private set;}
public integer amount {get;set;}
public PartialPagerefreshController() {
value=0;
}

public PageReference increment(){
value+=amount;
return null;
}

}