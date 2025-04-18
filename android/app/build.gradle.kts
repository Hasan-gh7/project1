plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // إضافة Google Services
}

android {
    namespace = "com.example.property_management_system"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.property_management_system"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // إضافة Firebase BoM لإدارة إصدارات Firebase
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))
    
    // إضافة Firebase Analytics
    implementation("com.google.firebase:firebase-analytics")
    
    // إضافة المكتبات الأخرى الخاصة بـ Firebase إذا كنت بحاجة إليها
    // يمكنك الاطلاع على القائمة الكاملة هنا:
    // https://firebase.google.com/docs/android/setup#available-libraries
}