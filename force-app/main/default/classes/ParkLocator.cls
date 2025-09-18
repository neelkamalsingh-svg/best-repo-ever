public class ParkLocator {
    public static String[] country(String s){
      ParkService.ParksImplPort portVar = new ParkService.ParksImplPort();
        List<String> parkList = portVar.byCountry('Germany');
        system.debug('parkList : '+parkList);
        return parkList;
       
    }
}