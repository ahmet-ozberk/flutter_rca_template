# Flutter Riverpod Clean Architecture

A Flutter project implementing Clean Architecture principles with Riverpod state management.

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── di/
│   ├── failure/
│   ├── network/
│   └── utils/
├── data/
│   ├── datasource/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── views/
    └── widgets/
```

## Architecture Overview

This project follows Clean Architecture principles, divided into three main layers:

### 1. Presentation Layer
- Contains all UI components (views, widgets)
- Implements Riverpod providers for state management
- Handles user interactions and state updates

### 2. Domain Layer
- Contains business logic
- Defines entities and repository interfaces
- Implements use cases for business operations

### 3. Data Layer
- Implements repository interfaces
- Handles data sources (API, local storage)
- Performs data transformations

### Core Layer
- Contains shared utilities and constants
- Implements dependency injection
- Handles network operations and error management

## Dependencies

- **flutter_riverpod**: State management solution
- **dio**: HTTP client for API requests
- **equatable**: Simplifies equality comparisons

## Features

- Clean Architecture implementation
- Riverpod state management
- API integration with Dio
- Separation of concerns
- Dependency injection
- Error handling
- Testable code structure

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Best Practices

- Following SOLID principles
- Dependency injection using Riverpod
- Error handling and exception management
- Clear separation between layers
- Testable code structure
- Consistent naming conventions
- Documentation for complex logic

## Testing

The project structure supports different types of tests:

- Unit tests for business logic
- Integration tests for repository implementations
- Widget tests for UI components

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
