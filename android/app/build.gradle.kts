import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // 🔑 必须显式写版本号
    id("com.google.gms.google-services") version "4.4.3" apply false
}

val envProperties = Properties().apply {
    load(rootProject.file("../configs/env.props").inputStream())
}

android {
    namespace = "com.mice.minions"
    compileSdk = flutter.compileSdkVersion
//    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
//        applicationId = "com.mice.minions"
        applicationId = envProperties.getProperty("androidPackageName")
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        ndk {
            abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
        }
        resValue("string", "app_name", envProperties.getProperty("appName"))
        resValue("string", "android_package_name", envProperties.getProperty("androidPackageName"))
    }

    signingConfigs {
        create("release") {
            keyAlias = envProperties.getProperty("keyAlias")
            keyPassword = envProperties.getProperty("keyPassword")
            storeFile = rootProject.file("../configs/${envProperties.getProperty("storeFile")}")
            storePassword = envProperties.getProperty("storePassword")
            enableV1Signing = true
            enableV2Signing = true
        }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
//            signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")
//            signingConfig = null
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}
dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:34.1.0"))


    // TODO: Add the dependencies for Firebase products you want to use
    // When using the BoM, don't specify versions in Firebase dependencies
    implementation("com.google.firebase:firebase-analytics")

    // 这里加上 google-services 插件
    implementation("com.google.gms:google-services:4.4.3")
    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
}