### 🚧 This branch is still under development 🚧

# Clot Ecommerce

This is a Flutter mobile application basead on a [Figma Ecommerce UI Kit](https://www.figma.com/community/file/1233130764703685276) by Emmanuel Nwankwo. This is my first Flutter project which I started with the objective to apply the knowledge recently acquired during a Flutter course by [Alura](https://alura.com.br).

## Getting Started

Firstly this project relies on a back-end service which you can check [here](https://github.com/willperes/clot_ecommerce_api). This API provides the data needed to run the application, such as category and product data. More info on how to use it on it's repository.

## How to Use 

**Step 1:**

Clone this repo by using the command below:

```bash
git clone https://github.com/willperes/clot_ecommerce.git
```

**Step 2:**

Go to project root and execute the following command in the console to get the required dependencies: 

```bash
flutter pub get 
```

**Step 3:**

Run the project with the following command:

```bash
flutter pub run
```

## Features:

* Routing
* Theme
* Provider (State management)
* Shopping cart

### Up-Coming Features:

* Authentication
* Finish orders
* Dark Theme Support
* Add products to your favorites

### Libraries & Tools Used

* [Provider](https://pub.dev/packages/provider) (State management)
* [http](https://pub.dev/packages/http)
* [http_interceptor](https://pub.dev/packages/http_interceptor)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
* [flutter_svg](https://pub.dev/packages/flutter_svg)
* [shimmer](https://pub.dev/packages/shimmer)
* [test](https://pub.dev/packages/test) (Tests)
* [equatable](https://pub.dev/packages/equatable) (Tests)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- data/ (State management)
|- models/ (Data models)
|- screens/ (Contains the screens of the application)
|- services/ (Http request logics)
|- theme/ (Contains the app's theme configurations)
|- utils/ (Utilities/common functions of the application)
|- widgets/ (Contains commonly used Widgets)
```

## Screenshots

<div style="display: flex; flex-direction: row;">
  <img src="https://i.imgur.com/cfdayAt.png" alt="Home screen skeleton" width="auto" height="500">
  <img src="https://i.imgur.com/s4YRSDH.png" alt="Home screen" width="auto" height="500" style="margin-left: 8px">
</div>

<div style="display: flex; flex-direction: row;">
  <img src="https://i.imgur.com/gpC3cZp.png" alt="Category selection screen" width="auto" height="500">
  <img src="https://i.imgur.com/cBJxEJS.png" alt="Category products" width="auto" height="500" style="margin-left: 8px">
</div>

<div style="display: flex; flex-direction: row;">
  <img src="https://i.imgur.com/dUSQ6He.png" alt="Product details screen" width="auto" height="500">
  <img src="https://i.imgur.com/KB5xFhf.png" alt="Product size selection" width="auto" height="500" style="margin-left: 8px">
</div>

<div style="display: flex; flex-direction: row;">
  <img src="https://i.imgur.com/D5E1iIO.png" alt="Cart screen skeleton" width="auto" height="500">
  <img src="https://i.imgur.com/eLA8TuV.png" alt="Cart screen" width="auto" height="500" style="margin-left: 8px">
</div>