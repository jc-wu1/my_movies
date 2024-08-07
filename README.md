# MyMovie

## ⚠️ Warning! This project was created and tested only on Android devices
## ⚠️ Any errors occurring when running this project on iOS are not the developer's responsibility

## Features
*  Guess login
*  Add movie to watchlist
*  Add movie to favorite
*  Save a poster to gallery

## Screenshots
<p>
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android1.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android2.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android3.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android4.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android5.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android6.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android7.png" width="250" />
  <img src="https://github.com/jc-wu1/my_movies/blob/master/screenshot/android8.png" width="250" />
</p>

## Quick start
This is a Flutter project. You should follow the instructions in the [official documentation](https://flutter.io/docs/get-started/install).
This project uses **BLoC** (business logic component) to separate the business logic with UI itself, and uses clean architecture approach.
It's recommended to do self-study about it before jumping into the project [here](https://bloclibrary.dev/) and [here](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).


## Built With 🛠
* [BLoC](https://bloclibrary.dev/) - Business logic component to separate the business logic with UI.
* [Dio](https://github.com/flutterchina/dio/) - A type-safe HTTP client.
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator.
* [IsarDB](https://isar.dev/) - Super Fast Cross-Platform Database for Flutter.
* [Shimmer](https://pub.dev/packages/shimmer) - A better loading placeholder.
* [Get It](https://pub.dev/packages/get_it) - A Dependency Injection


## How to run the App
1. Clone this project.
2. Open with your favorite tools editor.
3. Run `flutter pub get` to get dependencies ready.
4. You can use your TMDB API key or use my API key. To add your `apiKey` into ***lib/core/network/api_constants.dart*** file.
5. Use command `flutter run` to run the app

## Note
* To login use this username and password. username = julian, password = julian_test

## Author

* **Julian C.**

## License

```
MIT License

Copyright (c) [2024] [Julian C.]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
