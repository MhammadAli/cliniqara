<!-- changelog.md -->
* Created the `Patient` domain entity with a `copyWith` method, utilizing `equatable` for value comparison.
* Implemented the `PatientAge` class with an `AgeUnit` enum (years, months, days) to accurately represent dynamic age types from the UI.
* Added a `Gender` enum (male, female, other) and an `extraData` map with a default empty fallback to satisfy the hybrid drift schema rule.