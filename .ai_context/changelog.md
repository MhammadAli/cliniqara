# Target: `changelog.md`

- Created pure Domain entity `Patient` in `lib/domain/entities/patient.dart`.
- Created `PatientAge` value object utilizing `AgeUnit` enum to support scalar age values based on UI toggle selection.
- Included `extraData` as a `Map<String, dynamic>` to support the hybrid database schema future-proofing strategy.

<!-- changelog.md -->
* Created the core `Failure` and `DatabaseFailure` classes in `lib/core/error/failures.dart` extending `Equatable`.
* Added the `PatientRepository` interface in `lib/domain/repositories/patient_repository.dart` for CRUD operations.
* Safely wrapped all repository return types using `dartz`'s `Future<Either<Failure, T>>` and `Unit`.

<!-- changelog.md -->
* Created the `AppDatabase` drift database setup in `lib/data/datasources/local/app_database.dart` defining the `Patients` table with an `extraData` fallback column.
* Built safe serialization mappers in `lib/data/mappers/patient_mapper.dart` to decode/encode drift's `PatientData` mapping neatly to pure Domain `Patient` entities with Enums converted from String schemas.
* Implemented `PatientRepositoryImpl` in `lib/data/repositories/patient_repository_impl.dart`, overriding all domain repository contract methods with functional `dartz` error handling returning `Left(DatabaseFailure)` upon exception.

<!-- changelog.md -->
* Assembled the Dependency Injection root in `lib/core/di/injection_container.dart` using `get_it`, providing lazy singletons for `AppDatabase` (with `NativeDatabase.memory()`) and `PatientRepositoryImpl`, alongside a factory for `PatientRegistrationCubit`.
* Created standard boilerplate states (`Initial`, `Loading`, `Success`, `Error`) in `lib/presentation/cubits/patient_registration/patient_registration_state.dart` with `Equatable`.
* Built the `PatientRegistrationCubit` mapping raw UI data to a pure Domain `Patient` entity (generating IDs via `uuid`), processing safe exception handling via `dartz`'s `.fold()` mechanism.

<!-- changelog.md -->
* Extracted the name/phone input into `lib/presentation/widgets/custom_text_field.dart`, using dynamic theming (`Theme.of(context)`) and scaling properties to replace hardcoded Figma hex colors and rigid dimensions.
* Created `lib/presentation/widgets/age_input_row.dart` encapsulating the age input `CustomTextField` wrapped alongside a native Material 3 `SegmentedButton` to control the Domain's `AgeUnit` toggle constraint logically via callbacks.
* Built `lib/presentation/widgets/gender_selection_row.dart` mapping over the `Gender` enum values to construct dynamic selectable cards that broadcast up via a `ValueChanged<Gender>` event.

<!-- changelog.md -->
* Created the `PatientRegistrationScreen` utilizing isolated `widgets/` components to assemble the UI effectively within a `SingleChildScrollView` to handle keyboard popping.
* Integrated `BlocConsumer<PatientRegistrationCubit, PatientRegistrationState>` correctly to respond to UI interactions, validating fields locally, triggering Cubit `submitRegistration`, and disabling interactions smoothly when `state is PatientRegistrationLoading`.
* Enforced responsive constraints limiting the central registration card to `maxWidth: 800` utilizing flexible layout parameters mapped globally to Material 3 `.colorScheme` elements preventing any hardcoded values to persist.

<!-- changelog.md -->
* Updated `lib/main.dart` with an asynchronous `main` method, executing `WidgetsFlutterBinding.ensureInitialized()` to ensure `await di.init()` finishes safely before the app launches.
* Replaced standard navigation logic with a `GoRouter` configuration (Rule #5), defining `/` as the primary route targeting the newly created `PatientRegistrationScreen`.
* Wrapped the entry route builder in a `BlocProvider` mapped to `di.sl<PatientRegistrationCubit>()`, delivering the injected cubit to the UI screen effectively.

<!-- changelog.md -->
* Created `lib/core/navigation/app_router.dart` to hold the application's GoRouter setup (`appRouter`), decoupling mapping responsibilities from the root entry file.
* Centralized route dependencies (`PatientRegistrationScreen`, `PatientRegistrationCubit`, etc.) into the router's scope.
* Stripped `lib/main.dart` back to a clean entry structure handling only base `MaterialApp.router` configurations and global `di.init()` binding.