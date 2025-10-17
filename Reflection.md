# TeamSeasDatabaseTHING
I can't stop (HEKALE!)
The loneliness (SHAW!!!)

# Refleksjon
Jeg gjorde databasen så enkel som mulig, å valgte bare å ha med de viktigste elementene: 

Det er 4 Tabeller.
LoginInfo, Volunteer, Arrangements og Volunteer_Info_Has_Arrangements

Volunteer og Arrangementer holder informasjon om dems egne ting.

Volunteer har fornavnet, etternavnet og adressen til den frivilige.
Arrangementer har hvor arrangementet er, Datoen av arrangementet og BildeURL til arrangementets bilde.


LoginInfo er koblet til Volunteer med en 1:1 relasjon, siden 1 person kan bare ha 1 loginInfo.

Volunteer og Arrangementer har en n:m relasjon, hvor 1 frivillig kan være påmeldt flere forskjellige arrangementer, og 1 arrangement kan ha flere frivillige.


Jeg valgte bare å inkludere disse elementene fordi jeg tror at de kan være realistiske til hva databasen til en ordentlig frivillig organisasjon kan se ut som.


Jeg har lært mye mer om databasen, og føler meg mer komfortabel med SQL enn før. Jeg synes at å jobbe med SQL er ganske morsomt, og jeg kan se hvor nyttig det er.