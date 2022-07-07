Feature: Faz 2 Api ve UI
  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/chromedriver.exe'}
    * driver "https://open.spotify.com/"
    * maximize()
    * def urlAdi = 'https://open.spotify.com/'
    * def userId = '31ekssjamah2psknmlcofd6potuq'
    * def token = 'Bearer BQBWuQhQgtcbkAhBq4EBe_iShFVQQKSh72w0YpE3nnAyVVQu0PwY8YIS8TMMSEnpb4b7BcE1O2hSDDmKXc4xQm01KJKn6SVdl2_jNmcQBEsv2hS0BKHu4B155HcjYO4ThzYs9b2jTME1Gn1WYgsInEdx7UhHKDBknsfrGKLvbBusb066RdirUtjNEVfpTSMEBeV3CWvJVQyai5YuPlJ_zqd3bVvchtWOj7g6PZKyZlIb2bSCUPNDO1ICX2WoZiQI'
    * def currentToken = 'Bearer BQAfnI5AAL9rxmfcgo5XVF617b4hIYL_zeVT1UGtbHPl4u6xrrI7BzSN5nqzYpUG6rB0057qbay4Z1F4kp3pWMt5U7piAOiengf6_nQ6q43TmZI-L3DZexgCTwdsFEj64uB1U4nnQgyQE6WzcMMnJSFk_yNq5ikdg60UvmrEgAu0RWi_s9ERMJQbA3I9-lYBWris0AN7'
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




