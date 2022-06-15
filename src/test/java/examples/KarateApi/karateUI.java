package examples.KarateApi;

import com.intuit.karate.junit5.Karate;

public class karateUI {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("KarateUI").relativeTo(getClass());
    }

}
