Feature: Karate Api Testi
  Background:
    * def urlAdi = 'https://open.spotify.com/'
    * def userId = '31ekssjamah2psknmlcofd6potuq'
    * def token = 'Bearer BQCHdDKgCzRrSNeVEFf7QpdCNaSpAOkhRE-ab4bGH11N_pnzkYS9r61sjiM5GSHlQkywuihNBGYu5epqqnJf_SNbygfJ-QH9gbmxXi4XlkIyN2ER_LXkXQVGh8vdqiuaxl-PBH9qez5c4XdHWwqysg_Yh55vUtotloYwQ1NWKRTBdDv_RqGsnt-a3H0cG4MWcoCSnNropzzblFSqtLjkKcOVuWhmFOjRqmB3fxffMnF5ZJFC2cEQsM8aDYj5fv3440ZZFJ7QEbMWp-8vLSTE7OA'
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