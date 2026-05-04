# Target: `changelog.md`

- Created pure Domain entity `Patient` in `lib/domain/entities/patient.dart`.
- Created `PatientAge` value object utilizing `AgeUnit` enum to support scalar age values based on UI toggle selection.
- Included `extraData` as a `Map<String, dynamic>` to support the hybrid database schema future-proofing strategy.