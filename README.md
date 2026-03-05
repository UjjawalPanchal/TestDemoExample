# test_project

1. Showing a Modal Bottom Sheet
   A Modal Bottom Sheet is a "surface" that slides up from the bottom of the screen to show extra options or information without navigating to a new page.

The Function: Use showModalBottomSheet(context: context, builder: (context) => Widget).

Modal vs. Persistent: A Modal sheet blocks the rest of the app until it is dismissed (the user taps outside or swipes down). A Persistent sheet (rarely used)
allows interaction with the background.

The isScrollControlled Property: By default, bottom sheets only take up half the screen. If you have a lot of content (like a long form), set
isScrollControlled: true to allow it to expand to the top.

The Shape: You can give it a professional look using shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))).

Trainer Tip: Remind students that because the bottom sheet is a separate "route," they may need to use a StatefulBuilder if they want to update the state of
widgets inside the sheet.

2. Custom Fonts
   Typography is the strongest tool in UI design. Flutter allows you to use any .ttf, .otf, or Google Font.

The Configuration (pubspec.yaml)
Place the font files in an assets/fonts/ folder.

Declare them in pubspec.yaml under the flutter: section:

YAML
fonts:

- family: MyCustomFont
  fonts:
    - asset: assets/fonts/MyFont-Regular.ttf
    - asset: assets/fonts/MyFont-Bold.ttf
      weight: 700
      Crucial Rule: Indentation must be perfect, or the app will fall back to the default system font.

3. Working with TextTheme
   Instead of applying font styles to every single Text widget manually, use the TextTheme in your global ThemeData.

The Structure: Flutter uses a standardized naming convention (Material 3):

displayLarge/Medium/Small (For big headlines)

headlineLarge/Medium/Small (For section headers)

titleLarge/Medium/Small (For list items or app bars)

bodyLarge/Medium/Small (For standard text)

Global Setup: Define the textTheme inside ThemeData to apply your custom font globally:

Dart
ThemeData(
fontFamily: 'MyCustomFont', // Applies to every text widget in the app
textTheme: TextTheme(
displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
),
)
The "Inheritance" Syntax: In your UI, use style: Theme.of(context).textTheme.bodyLarge. This ensures that if you decide to change the font size later, you only
change it in one file.