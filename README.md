# 🧺 Freshly - Grocery Shopping App

**Freshly** هو تطبيق بقالة إلكترونية متكامل تم تطويره باستخدام Flutter. يوفّر تجربة تسوق بسيطة وسريعة للمستخدمين لشراء الخضروات، الفواكه، الأسماك، منتجات الألبان والمزيد، مع واجهة جذابة، ودعم اللغتين (العربية والإنجليزية) بالإضافة إلى الوضع الليلي.

---

## 📽️ Demo

📱 شاهد فيديو توضيحي لتجربة التطبيق:  
[[▶️ Demo Video](https://drive.google.com/file/d/12wqM_1uyezEkcbHJ-fcp4O9cW2H-qwEn/view?usp=sharing)
](https://drive.google.com/file/d/12wqM_1uyezEkcbHJ-fcp4O9cW2H-qwEn/view?usp=sharing)
---

## 📱 Screens & Features

### 🧭 Navigation Flow
- Splash Screen → Welcome Screen → (Sign In / Sign Up) → Main App

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/auth.png" width="400"/>

- Bottom Navigation Bar للتنقل بين:
  - 🛒 Shop
  - 🔍 Explore
  - ❤️ Favorites
  - 🛍️ Cart
  - 👤 Account

---

### 🛒 Shop
- عرض الإعلانات الترويجية
- عرض الفئات (Categories)
- عرض المنتجات الشائعة (Popular Products)


### 🔍 Explore
- استعراض كل الفئات (خضروات، فواكه، أسماك، كيك، ألبان...)
- التنقل السريع إلى المنتجات المرتبطة بكل فئة

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/shop_explore.png" width="400"/>



---

### 📦 Product Details
- تفاصيل المنتج (اسم، وصف، سعر)
- اختيار عدد الكيلوهات المطلوبة
- حساب السعر الإجمالي تلقائيًا
- أزرار:
  - إضافة للسلة (Add to Cart)
  - إضافة للمفضلة (Add to Favorites)
 
<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/product_details.png" width="400"/>


---

### 🛍️ Cart
- عرض المنتجات المضافة للسلة
- حذف أي منتج باستخدام Dismissible Animation
- عرض السعر الكلي
- زر "Check Out"
- يمكن الدفع من خلال "Paypal"
- تصميم مخصص لحالة السلة الفارغة لجعل التجربة تفاعلية

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/cart.png" width="400"/>


---

### ❤️ Favorites
- عرض المنتجات المفضلة
- إمكانية الحذف منها
- شاشة فارغة بتصميم جذاب

<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/fav.png" width="400"/>


---

### 👤 Account
#### 🗺️ Addresses
- تحديد العنوان يدويًا من خلال فورم
- أو تلقائيًا باستخدام Google Maps


<img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/addresses.png" width="400"/>


#### 👤 Profile
- رفع صورة شخصية
- تغيير الثيم (فاتح / داكن)
- تغيير اللغة (عربي / إنجليزي)
- تغيير كلمة المرور

- <img src="https://raw.githubusercontent.com/ahmedgfouad/Freshly/main/screenshots/account.png" width="400"/>




---

## 🧠 Architecture & Stack

- 🏗️ **Architecture**: 
  - `presentation` (UI & Cubit)
  - `data` (Models, DataSources, Hive, Firebase)
- ⚙️ **State Management**: `flutter_bloc (Cubit)`
- 🐝 **Local Storage**: `Hive`
- 🔥 **Backend**: `Firebase`
  - Firebase Authentication
  - Firebase Firestore
- 🌍 **Maps**: Google Maps API (لتحديد العنوان)

---

## 📦 Packages Used

| Package                  | Purpose                                      |
|--------------------------|----------------------------------------------|
| `flutter_bloc`           | إدارة الحالة باستخدام Cubit                 |
| `hive` + `hive_flutter`  | التخزين المحلي                              |
| `firebase_auth`          | تسجيل الدخول/التسجيل                        |
| `cloud_firestore`        | حفظ المنتجات والفئات                        |
| `google_maps_flutter`    | تحديد الموقع                                |
| `cached_network_image`   | تحميل الصور بكفاءة                          |


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

