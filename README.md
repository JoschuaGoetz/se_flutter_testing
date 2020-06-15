# e-Portfolio Flutter Testing

The actual app is made by [DennisRein](https://github.com/DennisRein/se_flutter). This repository just displays how to test a flutter app

## Disclaimer
This is also supposed to be the handout. I didn't convert this to Pdf because converters are not so good with code. 
So enjoy markdown. Full tutorial is [Flutter]

## Installation 

1. Install flutter -> https://flutter.dev/docs/get-started/install
2. Install Android Studio and the android sdk -> https://developer.android.com/studio/install
3. Get a device to run the tests
    - Run on a emulator -> https://developer.android.com/studio/run/emulator
    - Run on your own device -> https://developer.android.com/studio/run
4. Add the following plugins to your `pubspec.yml` and run pub get
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_driver:
    sdk: flutter
  test: any
```

## Unit tests fundementals

- All tests have to be in the test folder
- All tests have to end with `_test.dart`
- All test files must have a main function
- Compare values with the expect function
- Set up and clean up with setUp and teardown
- Consider the following code for reference

```Dart
import 'package:flutter_test/flutter_test.dart';
import 'package:sepokedex/model.dart';

void main() async {
  Pokemon pokemon;

  setUp(() {
    print('I run before each and every test');
  });

  setUpAll(() {
    print('I run once before everything else');
  });

  tearDown(() {
    print('I run after each test');
  });

  group('group', () {

    tearDownAll(() {
      print('I run once after this group');
    });

    test('has the correct name', () async {
      int sum = 1 + 2;

      expect(sum, 3);
    });

  });
}
```

- Execute tests from your flutter root with the command
```
flutter test
```
- If you want code coverage. Visualized on [codacy](https://app.codacy.com/manual/JoschuaGoetz/se_flutter_testing/files?bid=18631027)
```
flutter test --coverage
```

## Integration tests fundementals

- All tests have to be in the test_driver folder
- Each test consists out of two files
    - A file called like you want. E.g `app.dart`
    - A test file called `app_test.dart`

`app.dart` contains everything to execute the test. It sets up the test and runs the app. Minimal file is as follows.
```Dart
import 'package:flutter_driver/driver_extension.dart';
import 'package:sepokedex/main.dart' as app;

void main() {
  // Enable the flutter driver extension to run and capture tests
  enableFlutterDriverExtension();

  // Configure things here before the app is launched.

  // Execute the main app
  app.main();
}

```

`app_test.dart` contains the tests you want to execute on your app. Structure is similar to an unit test.

### Finding a widget

- In order to find a widget you have to give it a key
```Dart
Align(
    alignment: Alignment.centerLeft,
    child: Text(
        pokemon.name,
        key: Key('pokemonName'),
        style:
            Theme.of(context).textTheme.headline1.copyWith(fontSize: 72),
    ),
),
```
- Then use the method `byValueKey` of the built-in object finder
```Dart
final pokemonName = find.byValueKey('pokemonName');
```

### Interacting with a widget

- Tap it
```Dart
await driver.tap(firstPokemon);
```
- Write to anything that is a text field and currently focused
```Dart
driver.enterText('Text to enter')
```

### Execute tests from your flutter root with the command
```
flutter drive --target=test_driver/app.dart
```