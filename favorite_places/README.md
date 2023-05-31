# favorite_places

## 빌드 문제
1. location 라이브러리 코틀린 버전 문제
### how to fix
```
android studio에서
flutter plugins 중 location-4.4.0을 찾아 build.gradle에서 ext.kotlin_version 값을 다음과 같이 변경
ext.kotlin_version = '1.5.20'
```