public class SampleClassforTestUtility {
    //This is just sample class that will have test class using the test utility
    public Integer DummyClass(){
        List < Case > sampleCases = [Select Id, AccountId, Origin, Status, Priority, Subject, Type from Case];
        //system.debug('Account: ' + sampleCases[0].AccountId);
        return sampleCases.size();
    }
}