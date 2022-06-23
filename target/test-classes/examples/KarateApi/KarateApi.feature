Feature: Karate Api Testi
  Background:
    * def urlAdi = 'https://open.spotify.com/'
    * def userId = '31ekssjamah2psknmlcofd6potuq'
    * def token = 'Bearer BQDzdRY66ttmqVYoPOiRT1Cbvb4A0mhJ2v4ftuvEL9KOcJC_ThCP16ukuKnqrOmVare9WkxLTwpYg0QYrkP7XB4TWX2Y5bJ-qPH8qDfd22DmWO9_Uz3u9ULXBp3R9ad_HtfFtF7vlVTu1DDb3IC0fpmN8rHLCEPSHC7LfkMQOwGQFM9O2vidGUr2V3_P64IuTo7Y2CzQCrm-CZrh60QrdcZ77LohzlX0v_CVmabG8EH1peNVqxaD1wY_uUx-hDhyW4hkmfADXZkHVcuwQZI8U0Ze'
    * def requestBody =
 """
{
  "name": "Hilal New Playlist",
  "description": "New playlist description",
  "public": false
}
 """
    * def requestAdd =
 """
 {
  "uris": [
    "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ]
}
 """

  Scenario: Api testi
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
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method get
    Given url 'https://api.spotify.com/v1/'
    And path '/playlists/'+PlayListID+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request requestAdd
    When method post