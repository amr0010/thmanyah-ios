# Thmanyah iOS
*Arabic version below / النسخة العربية أدناه*

An iOS application built with Swift that displays content from various sources including podcasts, articles, and other media types.

## Screenshots

<img src="https://github.com/user-attachments/assets/cbbcaf42-1e02-4364-a434-8bc15fe130b9" width="300" />
<img src="https://github.com/user-attachments/assets/07db83f5-1446-470b-8cf6-eb2ffba6c6f8" width="300" />
<img src="https://github.com/user-attachments/assets/cf1486f9-b15f-4088-8d91-e6b7dfe86f9d" width="300" />


## Features

- **Home Feed**: Browse through different content types with pagination support
- **Search**: Search for specific content across different categories
- **Content Display**: View podcasts, articles, and other media content
- **Pagination**: Navigate through multiple pages of content
- **Testing**: Simple unit tests and UI tests included

## Architecture

The app follows Clean Architecture principles with MVVM pattern for presentation layer:

**Clean Architecture Layers:**
- **Presentation Layer**: SwiftUI views with MVVM pattern (ViewModels handle UI logic)
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repository pattern with network data sources

**Key Components:**
- SwiftUI for user interface
- ViewModels for presentation logic and state management
- Repository pattern for data abstraction
- Network layer for API communication
- Use cases for business logic encapsulation

## Setup

1. Clone the repository
2. Open the project in Xcode
3. Build and run the project

## Known Issues

### Home Endpoint Pagination
- **Issue**: When calling page 2 of the home endpoint, it returns page 1 data instead of the actual second page
- **Impact**: This causes diffing errors because the data contains the same IDs as the previous page
- **Current State**: Pagination is implemented for demonstration purposes, but the backend doesn't properly handle page parameters
- **Workaround**: The pagination UI works correctly, but the underlying data source limitation prevents proper page-by-page navigation

### Search Endpoint Inconsistency
- **Issue**: The search endpoint produces random data each time the same query is executed
- **Impact**: Inconsistent search results make it difficult to provide a reliable user experience
- **Content Type Issue**: The returned content type is a random string rather than proper categories (podcast, article, etc.)
- **Consequence**: Cannot reuse the same views from the home screen because the content type classification is unreliable

### Data Structure Inconsistency
- **Issue**: The API returns inconsistent data structures between home and search endpoints
- **Impact**: Required separate view implementations for search results instead of reusing home screen components
- **Technical Detail**: The content type field returns random strings instead of standardized categories

## Technical Notes

- Pagination was implemented primarily as a demonstration of the feature rather than functional requirement due to API limitations
- Search functionality works but with caveats around data consistency
- The app handles these API inconsistencies gracefully by implementing separate handling for different endpoints
- Simple unit tests are included to validate core functionality
- Basic UI tests are implemented to ensure critical user flows work correctly

## What Could Be Done / Future Improvements

### Architecture Enhancements
- **Coordinator Pattern**: Not implemented due to having only two pages in the app. For larger apps, coordinators would help manage navigation flow and decouple view controllers from navigation logic
- **Modularization with SPM**: Due to time constraints, the app is built as a single module. Future iterations could benefit from:
  - Separate Swift Package Manager modules for networking, UI components, and business logic
  - Core module for shared utilities and models
  - Feature-based modules for better separation of concerns

### API-Related Improvements
- Once API endpoints are stabilized, the pagination and search features can be fully functional
- Content type standardization would allow for component reuse across different screens
- Better error handling for API inconsistencies

### Development Improvements
- Unit tests for network layer and business logic (basic implementation included)
- UI tests for critical user flows (simple tests already implemented)
- Dependency injection container for better testability
- Protocol-based networking for easier mocking
- More comprehensive test coverage

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.0+

---

# ثمانية iOS

تطبيق iOS مبني بلغة Swift يعرض المحتوى من مصادر مختلفة بما في ذلك البودكاست والمقالات وأنواع الوسائط الأخرى.

## صور

<img src="https://github.com/user-attachments/assets/cbbcaf42-1e02-4364-a434-8bc15fe130b9" width="300" />
<img src="https://github.com/user-attachments/assets/07db83f5-1446-470b-8cf6-eb2ffba6c6f8" width="300" />
<img src="https://github.com/user-attachments/assets/cf1486f9-b15f-4088-8d91-e6b7dfe86f9d" width="300" />

## المميزات

- **الصفحة الرئيسية**: تصفح أنواع مختلفة من المحتوى مع دعم التقسيم إلى صفحات
- **البحث**: البحث عن محتوى محدد عبر فئات مختلفة
- **عرض المحتوى**: عرض البودكاست والمقالات ومحتوى الوسائط الأخرى
- **التقسيم إلى صفحات**: التنقل عبر صفحات متعددة من المحتوى
- **الاختبار**: اختبارات وحدة بسيطة واختبارات واجهة مستخدم مضمنة

## البنية المعمارية

التطبيق يتبع مبادئ Clean Architecture مع نمط MVVM لطبقة العرض:

**طبقات Clean Architecture:**
- **طبقة العرض**: عروض SwiftUI مع نمط MVVM (ViewModels تتعامل مع منطق واجهة المستخدم)
- **طبقة المجال**: المنطق التجاري وحالات الاستخدام
- **طبقة البيانات**: نمط Repository مع مصادر بيانات الشبكة

**المكونات الرئيسية:**
- SwiftUI لواجهة المستخدم
- ViewModels لمنطق العرض وإدارة الحالة
- نمط Repository لتجريد البيانات
- طبقة الشبكة للتواصل مع API
- حالات الاستخدام لتغليف المنطق التجاري

## التثبيت

1. استنسخ المستودع
2. افتح المشروع في Xcode
3. قم ببناء وتشغيل المشروع

## المشاكل المعروفة

### تقسيم صفحات نقطة النهاية الرئيسية
- **المشكلة**: عند استدعاء الصفحة الثانية من نقطة النهاية الرئيسية، ترجع بيانات الصفحة الأولى بدلاً من الصفحة الثانية الفعلية
- **التأثير**: يسبب هذا أخطاء في الفروقات لأن البيانات تحتوي على نفس المعرفات من الصفحة السابقة
- **الحالة الحالية**: التقسيم إلى صفحات مُنفذ لأغراض العرض، لكن الخادم لا يتعامل مع معاملات الصفحة بشكل صحيح
- **الحل المؤقت**: واجهة المستخدم للتقسيم تعمل بشكل صحيح، لكن قيود مصدر البيانات تمنع التنقل الصحيح بين الصفحات

### عدم الاتساق في نقطة نهاية البحث
- **المشكلة**: نقطة نهاية البحث تنتج بيانات عشوائية في كل مرة يتم تنفيذ نفس الاستعلام
- **التأثير**: نتائج البحث غير المتسقة تجعل من الصعب توفير تجربة مستخدم موثوقة
- **مشكلة نوع المحتوى**: نوع المحتوى المُرجع هو نص عشوائي بدلاً من فئات صحيحة (بودكاست، مقال، إلخ)
- **النتيجة**: لا يمكن إعادة استخدام نفس العروض من الشاشة الرئيسية لأن تصنيف نوع المحتوى غير موثوق

### عدم الاتساق في هيكل البيانات
- **المشكلة**: API يرجع هياكل بيانات غير متسقة بين نقاط النهاية الرئيسية والبحث
- **التأثير**: يتطلب تنفيذ عروض منفصلة لنتائج البحث بدلاً من إعادة استخدام مكونات الشاشة الرئيسية
- **التفاصيل التقنية**: حقل نوع المحتوى يرجع نصوص عشوائية بدلاً من فئات موحدة

## ملاحظات تقنية

- تم تنفيذ التقسيم إلى صفحات بشكل أساسي كعرض للميزة بدلاً من متطلب وظيفي بسبب قيود API
- وظيفة البحث تعمل لكن مع تحفظات حول اتساق البيانات  
- التطبيق يتعامل مع عدم الاتساق في API بشكل جيد من خلال تنفيذ معالجة منفصلة لنقاط النهاية المختلفة
- اختبارات الوحدة البسيطة مضمنة للتحقق من الوظائف الأساسية
- اختبارات واجهة المستخدم الأساسية منفذة لضمان عمل التدفقات الحرجة للمستخدم بشكل صحيح

## ما يمكن تحسينه / التحسينات المستقبلية

### تحسينات البنية المعمارية
- **نمط المنسق (Coordinator)**: لم يتم تنفيذه بسبب وجود صفحتين فقط في التطبيق. للتطبيقات الأكبر، المنسقون يساعدون في إدارة تدفق التنقل وفصل وحدات التحكم في العرض عن منطق التنقل
- **التقسيم إلى وحدات باستخدام SPM**: بسبب ضيق الوقت، التطبيق مبني كوحدة واحدة. الإصدارات المستقبلية يمكن أن تستفيد من:
  - وحدات Swift Package Manager منفصلة للشبكة ومكونات واجهة المستخدم والمنطق التجاري
  - وحدة أساسية للأدوات المشتركة والنماذج
  - وحدات قائمة على الميزات لفصل أفضل للاهتمامات

### تحسينات متعلقة بـ API
- بمجرد استقرار نقاط نهاية API، يمكن أن تكون ميزات التقسيم إلى صفحات والبحث فعالة بالكامل
- توحيد أنواع المحتوى سيسمح بإعادة استخدام المكونات عبر شاشات مختلفة
- معالجة أفضل للأخطاء لعدم الاتساق في API

### تحسينات التطوير
- اختبارات الوحدة لطبقة الشبكة والمنطق التجاري (التنفيذ الأساسي مضمن)
- اختبارات واجهة المستخدم للتدفقات الحرجة للمستخدم (اختبارات بسيطة منفذة بالفعل)
- حاوي حقن التبعية لقابلية اختبار أفضل
- شبكة قائمة على البروتوكول لسهولة المحاكاة
- تغطية اختبار أكثر شمولية

## المتطلبات

- iOS 16.0+
- Xcode 14.0+
- Swift 5.0+
