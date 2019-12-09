# onboarding_anim [![pub package](https://img.shields.io/pub/v/onboarding_anim.svg)](https://pub.dev/packages/onboarding_anim)

A library to create an onboarding in a simple way, and with a beautiful animation.

## Installation

You just need to add `onboarding_anim` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  onboarding_anim: ^1.0.1
```

## Example



[![Demo OnboardingAnim alpha](https://j.gifs.com/D1ZqKY.gif)](https://j.gifs.com/D1ZqKY.gif)

In order to create onboarding we need a list of pages in this case we use a model `PageModel`

## PageModel
### Simple page

This example only define title, body and an image (you can define any widget)

```dart
PageModel(
  title: "Relax",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna    aliqua. Ut enim ad minim veniam.",
  image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body03_final_01.png")),
)
```

### Page with custom colors

```dart
PageModel(
  title: "Relax",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna    aliqua. Ut enim ad minim veniam.",
  image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body03_final_01.png")),
  decoration: PageDecoration(
    pageColor: Colors.blue,
  )
)
```

### Page with custom text style

```dart
PageModel(
  title: "Relax",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna    aliqua. Ut enim ad minim veniam.",
  image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body03_final_01.png")),
  decoration: const PageDecoration(
    titleTextStyle: TextStyle(color: Colors.orange),
    bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
  )
)
```


### Page with widget body

This example show you how to define a page with a body as Widget and not a simple String
You can to the same this for title, with `titleWidget` parameter.

```dart
PageModel(
  title: "Relax",
  bodyWidget: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text("Click on "),
      Icon(Icons.edit),
      Text(" to edit a post"),
    ],
  ),
  image: Center(child: Icon(Icons.android)),
);
```

## OnboardingScreen Default

```dart
Scaffold(
  body: OnBoardingScreen (
    pages: pages,
    onDone: () => print("Done"),
    onSkip: () => print("Skip")
    )
)
```

## OnboardingScreen with Decoration

```dart
Scaffold(
body: OnBoardingScreen (
  onboardingDecoration: OnboardingDecoration(
    aling: Alignment.topCenter,
    child: Image(
      image: NetworkImage("https://www.themexpert.com/images/easyblog_articles/531/b2ap3_large_Mountains.PNG"),
      width: MediaQuery.of(context).size.width,
     )
   ),
   pages: pages,
   onDone: () => print("Done"),
   onSkip: () => print("Skip")
   ),
)
```
## Custom Colors Indicators

```dart
Scaffold(
  body: OnBoardingScreen (
    onboardingDecoration: OnboardingDecoration(
      aling: Alignment.topCenter,
      child: Image(
        image: NetworkImage("https://www.themexpert.com/images/easyblog_articles/531/b2ap3_large_Mountains.PNG"),
        width: MediaQuery.of(context).size.width,
       )
     ),
     pages: pages,
     onDone: () => print("Done"),
     onSkip: () => print("Skip"),
     indicatorDecoration: IndicatorDecoration(
      active: Colors.red,
      inactive: Colors.blueGrey,
      shadow: Colors.blue
    )
  )
)
```
