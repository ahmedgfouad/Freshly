# 🧺 Freshly - Grocery Shopping App

**Freshly** is a fully-featured grocery shopping app built using Flutter. It offers a fast and user-friendly experience for purchasing vegetables, fruits, fish, dairy, and more. The app features a beautiful interface, bilingual support (Arabic & English), and dark mode compatibility.

---

## 📽️ Demo

### 📱 Mobile Version:
[🔗 Click here to watch the demo video](https://drive.google.com/file/d/12wqM_1uyezEkcbHJ-fcp4O9cW2H-qwEn/view?usp=sharing)

---

## 📱 Screens & Features

### 🧭 Navigation Flow
- Splash Screen → Welcome Screen → (Sign In / Sign Up) → Main App

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/auth.png" width="280"/>

- Bottom Navigation Bar includes:
  - 🛒 Shop
  - 🔍 Explore
  - ❤️ Favorites
  - 🛍️ Cart
  - 👤 Account

---

### 🛒 Shop
- Promotional banners
- Category list
- Popular product section

---

### 🔍 Explore
- Browse all categories (vegetables, fruits, fish, cakes, dairy, etc.)
- Navigate to related products by category

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/shop_explore.png" width="280"/>

---

### 📦 Product Details
- View name, description, and price
- Select quantity (by KG)
- Auto-calculate total price
- Buttons:
  - Add to Cart
  - Add to Favorites

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/product_details.png" width="280"/>

---

### 🛍️ Cart
- List of added products
- Swipe to delete with Dismissible animation
- Total price calculation
- Checkout button
- Paypal payment support
- Custom empty cart UI for better UX

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/cart.png" width="280"/>

---

### ❤️ Favorites
- Display favorite items
- Remove items from the list
- Attractive empty state screen

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/fav.png" width="280"/>

---

### 👤 Account

#### 🗺️ Addresses
- Add address manually via form
- Or select location using Google Maps

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/addresses.png" width="280"/>

#### 👤 Profile
- Upload profile image
- Switch between light/dark mode
- Switch app language (English / Arabic)
- Change password

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/account.png" width="280"/>

---

## 🧠 Architecture & Stack

- 🏗️ **Architecture**: 
  - `presentation` (UI & Cubits)
  - `data` (Models, DataSources, Hive, Firebase)
- ⚙️ **State Management**: `flutter_bloc (Cubit)`
- 🐝 **Local Storage**: `Hive`
- 🔥 **Backend**: `Firebase`
  - Firebase Authentication
  - Firebase Firestore
- 🌍 **Maps**: Google Maps API (for address selection)

---

## 📦 Packages Used

| Package                  | Purpose                                      |
|--------------------------|----------------------------------------------|
| `flutter_bloc`           | State management using Cubit                 |
| `hive` + `hive_flutter`  | Local data storage                           |
| `firebase_auth`          | Authentication                              |
| `cloud_firestore`        | Store products and categories                |
| `google_maps_flutter`    | Address selection via map                    |
| `cached_network_image`   | Efficient image loading                      |

---

## 📂 Folder Structure

```bash
lib/
├── core/
│   ├── router/        
│   ├── services/      
│   ├── themes/        
│   ├── utils/        
│   └── widgets/      
├── features/               
│   ├── account/
│   │   ├── data/            
│   │   │   ├── models/       
│   │   │   └── services/      
│   │   └── presentation/
│   │       ├── address/
│   │       │   ├── manager/  
│   │       │   └── views/
│   │       │       ├── widgets/
│   │       │       ├── addresses_view.dart
│   │       │       ├── edit_address_view.dart
│   │       │       └── manual_new_address_use_google.dart
│   │       ├── order/
│   │       └── profile/
│   │           └── widget/
│   │               └── account_view.dart
│   ├── cart/                 
│   ├── explore/
│   │   └── presentation/
│   │       └── view/
│   ├── favorite/
│   └── home/                 
