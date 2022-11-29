# crescent
WIP mobile app for cohost.org

Not really usable at the moment, but can view home feed, tags, projects, comments, etc, as well as search for tags and projects.

Server-side user preferences are used to conditionally hide content warnings and adult posts, viewing bookmarks is also available.
 

## API
The API is implemented separately in [cohost_dart](https://github.com/snaeling/cohost_dart)! Its progress mostly mirrors this project.

## Screenshots
<p float="left">
<img src="github/home-feed.png " width="200" />
<img src="github/wip-theme.png " width="200" />
<img src="github/view-post.png " width="200" />
</p>
<p float="left">
<img src="github/view-project.png " width="200" />
<img src="github/search.png " width="200" />
<img src="github/content-warnings.png " width="200" />
</p>
<p float="left">
<img src="github/comments.png " width="200" />
</p>


</br>

## CSS Crimes?
HTML parsing tackles simple posts with little styling, but a prompt to view posts with complex styling in a webview is presented in such cases. Inline webviews are very unpleasant, especially on android devices below android 10, so it is not something I would like to implement.

## Framework, Architecture, etc
The project is using the master Flutter branch.

The project should adhere to [Andrea Bizzotto's riverpod architecture proposal](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/), a domain driven approach to riverpod projects. However, much of the app's domain foundation is implemented within [cohost_dart](https://github.com/snaeling/cohost_dart).

Crescent uses `riverpod` for its state management. `auto_route` is used for navigation, I trialed `beamer` and `go_router` (plus its upcoming stateful nested navigation) but found them obtuse or insufficient. 

`Isar` is used for the local database (e.g. project cache and settings), and `flutter_secure_storage` for encrypted storage.



