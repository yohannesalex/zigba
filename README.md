# Authentication and Employee Management Bloc Application

This project implements an authentication and employee management feature in a Flutter application using the Bloc state management library and Hive local storage management. It includes functionalities for user sign-up, login, employee addition and fetching, and company registration. The project follows Test-Driven Development (TDD) practices to ensure robust functionality.

## Features
- **Sign-Up:** Allows users to register with their details.
- **Login:** Enables users to authenticate and access the application.
- **Employee Management:**
  - Add new employees.
  - Fetch and display employee details.
- **Company Registration:** Allows companies to register and manage their data.
- **State Management:** Managed with Bloc to handle different states such as loading, success, and error.
- **Test Coverage:** Includes unit test for the basic components.

## Prerequisites
Make sure you have the following installed on your system:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0 or higher)
- Dart (comes with Flutter SDK)
- Git
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

## Installation and Setup

### Clone the Repository
```bash
git clone <https://github.com/yohannesalex/zigba>
cd <zigba>
```

### Install Dependencies
Run the following command to install the necessary dependencies:
```bash
flutter pub get
```

### Running the Application
To run the app on an emulator or a connected device, use the following command:
```bash
flutter run
```

## Testing
This project uses the `flutter_test` package for testing.

### Run Unit Tests
To execute unit tests, run:
```bash
flutter test
```

## Project Structure
The project follows a clean architecture pattern. Key directories per feature include:
- **Domain:** Contains entities, use cases, and interfaces.
- **Data:** Includes models and repositories.
- **Presentation:** Houses the Bloc logic and UI components.

### Key Files
- **AuthBloc:** Manages authentication-related events and states.
- **EmployeeBloc:** Handles employee-related events and states.
- **CompanyBloc:** Manages company registration and related states.
- **SignUpUseCase & LoginUseCase:** Encapsulate the business logic for sign-up and login functionalities.
- **RegiaterCompanyUseCase & GetCompanyUseCase:** Encapsulate the business logic for register comapny and get company functionalities.
**AddEmployeeUseCase & GetEmployeeUseCase:** Encapsulate the business logic for register employee and get employee functionalities.
- **AurhLocalDataSource:** Manages authentication-related data storage and retrieval.

- **EmployeeLocalDataSource:** Handles employee-related data storage and retrieval .
- **CompanyLocalDataSource:** Manages company-related data storage and retrieval .

## Development Workflow
### Adding a New Feature
1. Create the necessary use case in the `Domain` layer.
2. Add the corresponding repository implementation in the `Data` layer.
3. Update or create the Bloc to handle the new feature in the `Presentation` layer.
4. Write tests to ensure all new functionality works as expected.

### Contributing
If you'd like to contribute:
1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature description"
   ```
4. Push your branch and open a pull request.
   ```bash
   git push origin feature-name
   ```

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact
For further questions or suggestions, feel free to reach out:
- **Email:** [yohannes.abdia@gmail.com](mailto:yohannes.abdia@gmail.com)

Enjoy building with Flutter!

