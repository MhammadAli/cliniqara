# Target: `changelog.md`

- Created pure Domain entity `Patient` in `lib/domain/entities/patient.dart`.
- Created `PatientAge` value object utilizing `AgeUnit` enum to support scalar age values based on UI toggle selection.
- Included `extraData` as a `Map<String, dynamic>` to support the hybrid database schema future-proofing strategy.

<!-- changelog.md -->
* Created the core `Failure` and `DatabaseFailure` classes in `lib/core/error/failures.dart` extending `Equatable`.
* Added the `PatientRepository` interface in `lib/domain/repositories/patient_repository.dart` for CRUD operations.
* Safely wrapped all repository return types using `dartz`'s `Future<Either<Failure, T>>` and `Unit`.