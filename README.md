# Flutter App with AWS Amplify Authentication

This is a **Flutter** application that uses **AWS Amplify** for authentication. Follow the steps below to clone and run the project.

---

## Prerequisites
Before running the app, ensure you have:
1. **Flutter SDK**: [Installation Guide](https://docs.flutter.dev/get-started/install)
2. **Android Studio** (with Android SDK)
3. **AWS Amplify CLI**: [Installation Guide](https://docs.amplify.aws/cli/start/install/)
4. **AWS Credentials**: Access to the shared AWS account configured using `aws configure`.

---

## Steps to Clone and Run the Project

### 1. Clone the Repository

git clone https://github.com/Prathamesh0009/ts_social.git
cd https://github.com/Prathamesh0009/ts_social.git

### 2. Install Dependencies
Install the required Flutter packages:

flutter pub get

### 3. Pull Amplify Backend

Run the following command to pull the existing Amplify backend configuration:
amplify pull --appId d36qpcfx44exq9 --envName dev

### 4. Run the App

flutter run
