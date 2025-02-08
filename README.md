# Shopping Mall Application
This is a simple shopping mall application built with Flutter. The app has three main pages: a sign-in page with validations, a products page where users can add items to the cart and favorites, and a cart page where users can see added products, update quantities, and remove items. The app uses the drift database for storing cart items into the local database, and the BloC pattern is used as the state management library.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Screenshots

<img src="https://i.imghippo.com/files/NyM6736UY.jpg" alt="" border="0">
<img src="https://i.imghippo.com/files/NpZj9568L.png" alt="" border="0">
<img src="https://i.imghippo.com/files/xsg7033Ycw.png" alt="" border="0">
<img src="https://i.imghippo.com/files/fSEc6451WhY.png" alt="" border="0">
<br>

## Prerequisites

To run this project, you need to have Flutter installed on your local machine. Follow the installation instructions [here](https://docs.flutter.dev/get-started/install).

## Installing
1. Clone this repository on your local machine using the following command:
    ```bash
    git clone https://github.com/Srinivas-Mundlamuri/flutter_app.git
    ```
2. Navigate to the project directory:
    ```bash
    cd flutter-app
    ```
3. Install the dependencies using the following command:
    ```bash
    flutter pub get
    ```
4. Run the app on your preferred emulator or device using the following command:
    ```bash
    flutter run
    ```

## Features
- **Sign-In Page**: Includes form validation to ensure users enter valid credentials.
- **Products Page**:
    - Fetch products from a dummy JSON API and display them.
    - Add items to the cart and favorites.
    - Navigate to the cart or favorites page using the respective buttons.
- **Cart Page**:
    - View products added to the cart.
    - Update the quantity of items in the cart.
    - Remove items from the cart.
    - Navigate back to the products page.
- **Favorites Page**:
    - View products added to favorites.
    - Remove items from favorites.
    - Navigate back to the products page.
- **Snackbar Notifications**: Provide clear feedback on user actions such as adding/removing products and login.

## Built With
- **Flutter** - Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **drift** - A high-performance, easy-to-use SQLite database library for Flutter.
- **BloC pattern** - A predictable state management library that helps implement the Business Logic Component pattern.

