// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to our app`
  String get Welcome {
    return Intl.message(
      'Welcome to our app',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Shop online and get groceries delivered from stores to your home in as fast as 1 hour 🛒🚀`
  String get WelcomeDescription {
    return Intl.message(
      'Shop online and get groceries delivered from stores to your home in as fast as 1 hour 🛒🚀',
      name: 'WelcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your information to create an account.`
  String get SignupHint {
    return Intl.message(
      'Please enter your information to create an account.',
      name: 'SignupHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email and password to access your account`
  String get LoginHint {
    return Intl.message(
      'Enter your Email and password to access your account',
      name: 'LoginHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgote Password`
  String get ForgotePassword {
    return Intl.message(
      'Forgote Password',
      name: 'ForgotePassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Signin {
    return Intl.message(
      'Sign in',
      name: 'Signin',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signup {
    return Intl.message(
      'Sign up',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get Explore {
    return Intl.message(
      'Explore',
      name: 'Explore',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message(
      'Favorite',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get Shop {
    return Intl.message(
      'Shop',
      name: 'Shop',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Popular Deals`
  String get PopularDeals {
    return Intl.message(
      'Popular Deals',
      name: 'PopularDeals',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get Addresses {
    return Intl.message(
      'Addresses',
      name: 'Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get Payment {
    return Intl.message(
      'Payment',
      name: 'Payment',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Add To cart`
  String get AddToCart {
    return Intl.message(
      'Add To cart',
      name: 'AddToCart',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get CheckOut {
    return Intl.message(
      'Check Out',
      name: 'CheckOut',
      desc: '',
      args: [],
    );
  }

  /// `Start shoping`
  String get StartShoping {
    return Intl.message(
      'Start shoping',
      name: 'StartShoping',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `My Cards`
  String get MyCards {
    return Intl.message(
      'My Cards',
      name: 'MyCards',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get OldPassword {
    return Intl.message(
      'Old Password',
      name: 'OldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get Ongoing {
    return Intl.message(
      'Ongoing',
      name: 'Ongoing',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get TotalPrice {
    return Intl.message(
      'Total Price',
      name: 'TotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message(
      'EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kg {
    return Intl.message(
      'kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get AppSettings {
    return Intl.message(
      'App Settings',
      name: 'AppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get AddNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'AddNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `New Address`
  String get NewAddress {
    return Intl.message(
      'New Address',
      name: 'NewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Landmark`
  String get NearestLandmark {
    return Intl.message(
      'Nearest Landmark',
      name: 'NearestLandmark',
      desc: '',
      args: [],
    );
  }

  /// `Building Number / Floor / Apartment`
  String get BuildingFloorApartment {
    return Intl.message(
      'Building Number / Floor / Apartment',
      name: 'BuildingFloorApartment',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get StreetName {
    return Intl.message(
      'Street Name',
      name: 'StreetName',
      desc: '',
      args: [],
    );
  }

  /// `Governorate / City`
  String get GovernorateCity {
    return Intl.message(
      'Governorate / City',
      name: 'GovernorateCity',
      desc: '',
      args: [],
    );
  }

  /// `Successfuly`
  String get Successfuly {
    return Intl.message(
      'Successfuly',
      name: 'Successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Your heart is empty`
  String get EmptyHeart {
    return Intl.message(
      'Your heart is empty',
      name: 'EmptyHeart',
      desc: '',
      args: [],
    );
  }

  /// `Start fall in love with some good goods `
  String get StartLoveGoods {
    return Intl.message(
      'Start fall in love with some good goods ',
      name: 'StartLoveGoods',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is empty`
  String get EmptyCart {
    return Intl.message(
      'Your Cart is empty',
      name: 'EmptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Start filling your shopping cart`
  String get StartFillingCart {
    return Intl.message(
      'Start filling your shopping cart',
      name: 'StartFillingCart',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get UpdateProfile {
    return Intl.message(
      'Update Profile',
      name: 'UpdateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password must be the same as the New Password`
  String get ConfirmPasswordMismatch {
    return Intl.message(
      'Confirm Password must be the same as the New Password',
      name: 'ConfirmPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get EditAddress {
    return Intl.message(
      'Edit Address',
      name: 'EditAddress',
      desc: '',
      args: [],
    );
  }

  /// `Update Address`
  String get UpdateAddress {
    return Intl.message(
      'Update Address',
      name: 'UpdateAddress',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get Mode {
    return Intl.message(
      'Mode',
      name: 'Mode',
      desc: '',
      args: [],
    );
  }

  /// `Logging in....`
  String get Loggingn {
    return Intl.message(
      'Logging in....',
      name: 'Loggingn',
      desc: '',
      args: [],
    );
  }

  /// `Signing up....`
  String get SignupLoading {
    return Intl.message(
      'Signing up....',
      name: 'SignupLoading',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
