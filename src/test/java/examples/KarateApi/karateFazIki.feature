Feature: Faz 2 Api ve UI
  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/chromedriver.exe'}
    * driver "https://open.spotify.com/"
    * maximize()
    * def urlAdi = 'https://open.spotify.com/'
    * def userId = '31ekssjamah2psknmlcofd6potuq'
    * def token = 'Bearer BQDzdRY66ttmqVYoPOiRT1Cbvb4A0mhJ2v4ftuvEL9KOcJC_ThCP16ukuKnqrOmVare9WkxLTwpYg0QYrkP7XB4TWX2Y5bJ-qPH8qDfd22DmWO9_Uz3u9ULXBp3R9ad_HtfFtF7vlVTu1DDb3IC0fpmN8rHLCEPSHC7LfkMQOwGQFM9O2vidGUr2V3_P64IuTo7Y2CzQCrm-CZrh60QrdcZ77LohzlX0v_CVmabG8EH1peNVqxaD1wY_uUx-hDhyW4hkmfADXZkHVcuwQZI8U0Ze'
    * def currentToken = 'BQCVhOubYG64X4d3wGxeCNhnkkuASVrObK6G8NlpRW9YKl87w_zqJh9w3GoHfT5iSs5SzhxzzqdR5x5SgzzwuLOjfCwH_F3YsNMiH_61WTpvfXYeZWN2QRFlc3BL513a2Y639mLT43Q6O9c3aIr7FRgpF82fenG5pinhXLLRRhSR_2mD5cXgVBjGGqsOZFT2WMnZwdh1CwJY6ZJQtlcRAXd--PvlQi_z2i1AotcM1ja96YOpp8O1Eib7G9eqAurUogKD1cdJ4DfzZiXBo5iXShX2'
    * def requestBody =
 """
{
  "name": "MentorLabs Faz2",
  "description": "New playlist description",
  "public": false
}
"""
    * def requestAdd =
 """
 {
  "uris": [
    "spotify:track:3MrRksHupTVEQ7YbA0FsZK"
  ]
}
 """
  Scenario: Faz 2 Api ve UI Testleri
    Given delay(2000)
    When click('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set')
    And delay(1000)
    And input('#login-username',"hilalCalislarTest@gmail.com")
    And delay(1000)
    And input('#login-password',"test_faz14")
    And delay(3000)
    And click('#login-button')
    And delay(3000)


    Given url 'https://api.spotify.com/v1/'
    And path '/me'
    And header Authorization = token
    When method get

    Given url 'https://api.spotify.com/v1/'
    And path '/users/'+userId+'/playlists'
    And header Authorization = token
    And request requestBody
    When method post

    Then def PlayListID = response.id
    Given url 'https://api.spotify.com/v1/'
    And path '/search'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And param q = 'The Final Countdown'
    And param type = 'track'
    When method get

    Given url 'https://api.spotify.com/v1/'
    And path '/playlists/'+PlayListID+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request requestAdd
    When method post

    Given url 'https://api.spotify.com/v1/'
    And path '/me/player/currently-playing'
    And header Authorization = currentToken
    And method get
    * def verifySong = karate.jsonPath(response,"$.['item']['name']")
    Then match verifySong == 'The Final Countdown'
    * print verifySong

    Given delay(11000)
    When click('.AINMAUImkAYJd4ertQxy')
    And delay(3000)
    And click('.IconWrapper__Wrapper-sc-1hf1hjl-0.dZGDpi')
    And delay(30000)
    And click('.IconWrapper__Wrapper-sc-1hf1hjl-0.dZGDpi')
    And delay(3000)




