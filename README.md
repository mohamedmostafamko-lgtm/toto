# تطبيق التوصيل — نسخة أندرويد فقط

كل الأدوار (عميل / تاجر / مندوب / مدير / محاسب / موظف) في تطبيق واحد؛ التوجيه حسب `users/{uid}.role`.
نقطة الدخول الوحيدة: `lib/main.dart`.

## بناء الـ APK من الموبايل نفسه (بدون كمبيوتر)
1. ارفع المجلد على مستودع GitHub (من متصفح الموبايل: Add file > Upload files).
2. Settings > Secrets > Actions، أضف:
   - `FIREBASE_OPTIONS_DART` = محتوى ملف `lib/firebase_options.dart` الحقيقي (من `flutterfire configure`)
   - `MAPS_API_KEY` (اختياري للخرائط)
3. تبويب Actions > Build APK > Run workflow.
4. بعد دقائق نزّل `app-release.apk` من Artifacts، وافتحه على الموبايل (فعّل "تثبيت من مصادر غير معروفة").

## Firebase (مرة واحدة)
فعّل Authentication (Email/Password) وFirestore وStorage وFunctions (Blaze، المنطقة europe-west1) وCloud Messaging، ثم:
`cd functions && npm install && cd .. && firebase deploy --only firestore,storage,functions`

## أول مدير
سجّل حساب من التطبيق، ثم غيّر `role` إلى `admin` في Firestore > users/{uid}.

> الكود ما اتبنيش فعليًا بعد؛ لو ظهر خطأ في Actions ابعته وأصلحه.
