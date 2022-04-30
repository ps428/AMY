# AMY: A Meal by You

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/amy_logo.png" width=300>
</p>
  
AMY is an innovative food bank app designed by keeping SNU’s current mess ecosystem in consideration. AMY allows the students to make efficient use of their about to be lapsed mess card balance by making meal donations for the people for whom affording the meals is not that simple, eg. gardeners, nurserymen, guards working in night shifts etc.

AMY helps in efficient exhaustion of the almost lapsing mess card balance while making an effort to encourage the value of sharing among the student community and makes it more caring. It even gives a sense of warmth to the workers who then would feel more attached to their workplace. 

## Getting Started

This project is a starting point for a Flutter application. Just open the Flutter/amy directory in terminal and run: flutter run

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# App Screenshots:
## Public:
### App logo in mobile
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/app2.jpg" width=300>
</p>

### Loading page
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/load.jpg" width=300>
</p>
  
### Home Page
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/home.jpg" width=300>
</p>
  
### Login Page
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/login.jpg" width=300>
</p>
  
  
### Sign up page
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/signup.jpg" width=300>
</p>
  
  
## User Side Pages:
### User home
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/uhom1.jpg" width=300>
</p>

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/uhome2.jpg" width=300>
</p>

### User Donate
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/udonate1.jpg" width=300>
</p>

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/udonate2.jpg" width=300>
</p>

### User Confirm 
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/uconfirm.jpg" width=300>
</p>

### User Confirm 
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/uthanks.jpg" width=300>
</p>


### User Records 
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/urecord.jpg" width=300>
</p>

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/urecord2.jpg" width=300>
</p>


## Admin Pages
### Admin Home
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/ahome.jpg" width=300>
</p>

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/ahome2.jpg" width=300>
</p>

### Admin Serve
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/aserve.jpg" width=300>
</p>

<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/aserve2.jpg" width=300>
</p>

### Admin Bill
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/abill.jpg" width=300>
</p>

### Admin Inventory
<p align="center">
    <img src="https://github.com/ps428/AMY/blob/master/Flutter/amy/assets/screenshots/ainventory.jpg" width=300>
</p>

## File Structure
### 1. Public
* Loading page: main.dart -> LoadingScreen => DONE
* Login Sign up Page: home.dart -> HomeScreen => DONE
* Login Page: login.dart -> LoginScreen => DONE
* Sign Up Page: signin.dart -> SignupScreen => DONE

### 2. User
* User Home: uhome.dart -> UHomeScreen => DONE
* Donate Now: udonate.dart -> UDonateScreen => DONE
* Confirm Donation: uconfimation.dart -> DONE
* Bagde: uthanks.dart -> DONE
* My Account: uaccount.dart -> UAccountScreen => DONE
* Confetti / Thanks page: uthanks.dart -> UThanksScreen => DONE
* About page: about.dart -> DONE

### 3. Admin
* Admin Home: ahome.dart -> AHomeScreen => DONE
* Serve Meal: aserve.dart -> AServeScreen => DONE
* Bill: abill.dart -> ABillScreen => DONE
* Inventory: ainventory.dart -> AInventoryScreen => DONE

### 4. Backend Pages
* To access all pages: all.dart
* Firebase Authentication and other services: authentication_service.dart
* Default constants: constants.dart
* Testing file: test.dart
* Validate Firebase authentications: validate.dart
* Deafut Firebase generated: firebase_options.dart, generated_plugin_registrant.dart

## ToDo List
- [X] Basic Ideation
- [X] Problem Statement Definition and Proposal
- [X] Flutter Setup
- [X] Connect Firebase and Configure
- [X] Routing and Internal link test
- [X] Add a Loading Screen
- [X] Home Screen
- [X] Donate Now Screen
- [X] Login and Signup Pages
- [X] Firebase Auth on Login and Signup
- [X] Work on DB
- [X] Design a final flow for everything
- [X] Work on SRS doc
- [X] Finalize the flow of the app
- [X] User side page creation: Just need confetti 
- [X] User side DB work
- [X] Admin side page creation
- [X] Admin side DB work
- [X] Generation of Slip and Details (needs more thoughts on this)
- [X] Food bowl increment on donation (Slider {Chakra})
- [X] Global counter
- [X] Video/Gif/Slideshow as gratitue
- [X] Confetti and Thanking features (Quote, Badge etc)
- [X] User's record of donation
- [X] Add a user manual
- [X] Add a QnA page
- [X] Confirmation button upon donation
- [X] Timestamp of donation and serving : Donation done
- [X] In app notification on meal serving
- [X] Use group by kind of something to get superstar from the bill table
- [X] Add a graph. Can use sunc_fusion_flutter_charts
--------------------------
- [X] Confetti: Done
- [X] Card on personal details: Done 
- [X] Pictures: Done
- [X] Mustard or darkish yellow on confirm donation {behind confirm your donation}
- [X] About page: Floating icon: Amy card logo and some lines from first doc
- [X] Our team photo in about page: minds behind the meals
- [X] Sign out on right end in my account page
- [ ] Sort table in my account
- [X] Meal donated based food image
- [X] Table on confirm your donation
- [X] Spacing adjustment
- [X] Overall text size increment
- [X] Home: Above Welcome to amy, insert box; remove confetti button; Donate food->amy:a meal
- [X] Donate: Above start by.., insert box; add slider; get estimate and doante button size increase; food image slight small
- [X] My Account: reduce column gaps; correct table fonts
- [X] Photo small; mind behind the meals larger
- [X] Change headers text types
- [X] Home: Add lavendar card behind donation status
- [X] Home: Remove color from drop down breakfast, lunch, dinner in home page
- [X] Serve: Add confirmation popup
- [X] Bill: Add bill from keep
- [X] Inventory: Add lavendar color to header row {this has been done before somewhere in user}
- [X] Notification to user on meal confirmation



