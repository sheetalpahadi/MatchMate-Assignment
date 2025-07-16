**MatchMate** 
An app that lets you accept or decline suggested profiles for matchmaking.

1. Launch the app, a list of profiles is fetched from **API: (`https://randomuser.me/api/?results=10`)**
   A. If the fetching is successful, the profile cards are shown as a list
   B. If the fetching fails, list is retrieved from the last cached API response and profile cards are shown.
2. Select checkmark button to accept the profile match OR select x-mark button to decline the profile match.
   A. The UI changes as soon as you select a status
   B. This will save the accept/decline/no status of the profile in CoreData (persistent storage on disk)
   C. It is intentionally added, that once a fresh set of profiles is obtained, the status is appended to the already existing list of statuses.
   D. However the complete API response is cached, by clearing the previous cached items.

**Approaches used:**
1. For network calls, **Alamofire** is used.
2. For response caching, manual caching is done using **FileManager**, by saving cache files to disk
3. For storing accept/decline status, **CoreData** is used for persistent storing.
4. For loading images from web **SDWebImageSwiftUI** is used.

Hope you enjoy using the app!
