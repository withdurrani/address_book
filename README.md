# Address Book

## Objective

Given a list of contact names (List<String>), render an address book list where the names are grouped by their first character

## Why a “scroll to index” behaviour is not as straightforward?

ScrollController Controls the scroll position of the ListView. A scroll controller creates a [ScrollPosition] to manage the state-specific to an individual [Scrollable] widget. A [ScrollController] is a [Listenable]. It notifies its listeners whenever any of the attached [ScrollPosition]s notify _their_ listeners (i.e. whenever any of the scroll). It does not notify its listeners when the list of attached [ScrollPosition]s changes.

## Approach Taken

This project is created using Flutter and Dart.
A common MVVM architectural pattern is used. The state is managed using the Provider State Management. And I have used the [grouped_list] package to group the contacts in the list.

## Usage

1. Clone this repository
2. Navigate to the cloned path
3. Open the terminal/command prompt at this folder and run the below command to download the dependencies

```python
flutter pub get
```

4. Run the project using the below command by connecting/selecting your preferred device

```python
flutter run
```
