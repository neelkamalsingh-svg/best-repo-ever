public class StringArrayTest {
    public static List<String> generateStringArray( Integer i){
       List<String> var_List = new List<String>();
        for(Integer n=0;n<i;n++){
            system.debug('Test '+n);
            var_List.add('Test '+n);
        }
        return var_List;
    }

}