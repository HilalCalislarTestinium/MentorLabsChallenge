Feature: karate ui automation

  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/chromedriver.exe'}
    * driver "https://open.spotify.com/"
    * maximize()


  Scenario: uı automation test
    Given delay(2000)
    When click('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set')
    And delay(1000)
    And input('#login-username',"hilalCalislarTest@gmail.com")
    And delay(1000)
    And input('#login-password',"test_faz14")
    And delay(1000)
    And click('#login-button')
    And delay(3000)
    And click('.IPVjkkhh06nan7aZK7Bx')
    And delay(3000)
    And click('.o4KVKZmeHsoRZ2Ltl078')
    And delay(1000)
    And input("//input[@data-testid='playlist-edit-details-name-input']","MentorLabs Challenge")
    And delay(3000)
    And click('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set')
    And delay(3000)
    And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc',"Daft Punk")
    And delay(3000)
    And click('.gkgL9fB_pyDL75m9HKdu')
    And delay(3000)
    And click('.Button-y0gtbx-0.jjUWAm:nth-child(1)')
    Then delay(6000)

