#!/usr/bin/env bash
# تشغيل مرة واحدة من جوه مجلد المشروع:   MAPS_API_KEY=xxxx bash setup.sh
set -e
command -v flutter >/dev/null || { echo "Flutter مش متسطّب"; exit 1; }

# 1) ولّد مجلدات android / web / windows من غير ما نلمس الكود بتاعنا
mkdir -p .bak && cp -r lib .bak/ && cp pubspec.yaml .bak/
flutter create --platforms=android --project-name food_delivery --org com.example .
rm -rf lib && cp -r .bak/lib lib && cp .bak/pubspec.yaml pubspec.yaml
rm -f test/widget_test.dart

# 2) صوت الطلبات الجديدة
mkdir -p android/app/src/main/res/raw
cp setup/android_res_raw/* android/app/src/main/res/raw/

# 3) صلاحيات + خدمة التتبع + minSdk + مفتاح الخرائط
python3 setup/patch_android.py

flutter pub get
echo
echo "خلصت. الخطوات الجاية (يدوي):"
echo "  1) dart pub global activate flutterfire_cli && flutterfire configure   (اختار android بس)"
echo "  2) cd functions && npm install && cd .. && firebase deploy --only firestore,storage,functions"
echo "  3) أندرويد:  flutter run                  | كمبيوتر: flutter run"
