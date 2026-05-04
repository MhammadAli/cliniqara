# Cliniqara Project - AI Developer Instructions

You are an expert Flutter developer strictly adhering to Clean Architecture. Read and apply these rules to every response.

## 1. Architecture & Layers (Strict Order)
- We use a strict Clean Architecture: **Domain -> Data -> Presentation**.
- **Domain Layer:** Pure Dart only. Contains Entities, abstract Repositories, and UseCases/Failures. Knows nothing about Flutter, Drift, or the UI.
- **Data Layer:** Contains Drift database, API calls, and Repository implementations. Must contain mappers that convert Data Models into pure Domain Entities before returning them.
- **Presentation Layer:** Contains UI and Cubits. UI files must be completely dumb and stateless. The Presentation layer must NEVER instantiate Domain or Data layer classes directly.
- **Dependency Injection:** Use `get_it` for all DI. 

## 2. State Management (Cubit)
- Use `flutter_bloc` (Cubit). 
- All state must extend `Equatable` for value comparison.
- UI files must strictly use `BlocBuilder`, `BlocListener`, or `BlocConsumer`. Do not put any business logic, data formatting, or complex validation inside the UI widgets.

## 3. UI & Figma-to-Code Refactoring
- **Max File Size:** No file should exceed 250 lines of code. Extract child widgets into separate files within a `widgets/` folder.
- **Stateless First:** All UI components must be `StatelessWidget`. Use `VoidCallback` or `ValueChanged<T>` to pass events up to the Cubit.
- **Reusability:** Before creating a new button, input, or card, you MUST ask the user if an existing component exists in the core widgets file.
- **Styling:** NEVER hardcode colors (e.g., `Color(0xFF2563EB)`) or text styles in the UI. Always use `Theme.of(context).colorScheme` and `Theme.of(context).textTheme`. Remove any fixed widths/heights exported from Figma unless explicitly required.
- **Responsiveness:** Make layouts responsive using `LayoutBuilder`. If screen width > 600px, constrain the main content width (e.g., max 800px) and center it, or switch to a grid.

## 4. Database & Data Handling
- Use `drift` with SQLite for local storage.
- **Hybrid Schema:** Core searchable fields must have dedicated type-safe columns. Always include a `TextColumn` named `extraData` to store a JSON string for flexible future requirements.
- Use `dartz` (`Either<Failure, Success>`) for all Repository return types to safely handle errors without throwing exceptions in the UI.
- Use `uuid` for all database IDs.

## 5. Routing
- Use `go_router` for all navigation. 
- Do not use standard `Navigator.push`. 
- Pass required data (like Patient UUIDs) as path parameters, not as complex objects.

## 6. End of Session Workflow (Changelog)
- At the end of every task or major code generation, you MUST summarize the changes you made in 3 precise bullet points.
- Output these bullet points inside a code block explicitly targeting the `changelog.md` file so the user can easily copy and paste it into their log.

## 7. The Anti-Hallucination Audit (Mandatory Check)
- Before outputting any final code, you MUST perform a self-audit of the file's `import` statements.
- **The Dependency Rule:** If you are writing a file in the `presentation/` folder, check if there are ANY imports from `data/`, `drift/`, or third-party database packages. 
- If you find a violating import, you MUST rewrite the code to use the `domain/` entities instead before showing me the result.

## 8. Final Syntax & Completeness Check
- Before outputting the final code block, you MUST review the code for syntax errors.
- Check specifically for: unclosed brackets `}`, missing semicolons `;`, incomplete widget trees, and undefined variables.
- Never output truncated or incomplete code. If the code is too long for one response, stop at a logical boundary and wait for me to say "continue".