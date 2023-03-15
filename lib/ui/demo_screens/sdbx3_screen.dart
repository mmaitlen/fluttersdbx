// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sdbx/core/base_view.dart';
import 'package:sdbx/core/base_view_model.dart';
import 'package:sdbx/ui/widgets/utils.dart';

// pass Functions via tear-offs from ViewModel to View

// fun example on StackOverflow
// https://stackoverflow.com/questions/69065771/what-is-a-tear-off-tearoff-tear-off#:~:text=What%20is%20a%20tear%20off,most%20one%20required%20positional%20parameter.
// need a dart ticket to work on :) https://github.com/dart-lang/site-www/issues/1158
// refer to: lambda, anonymous function, closure
// anonymous function https://en.wikipedia.org/wiki/Anonymous_function
// closure https://en.wikipedia.org/wiki/Closure_(computer_programming)
//
// interesting StackOverflow on 'null widget' https://stackoverflow.com/questions/53455358/how-to-present-an-empty-view-in-flutter

// show a list of hobbies for users and allow them to pick their favorite

class Person {
  Person({required this.id, required this.label});

  final String id;
  final String label;
}

enum Hobby { biking, juggling, painting, hiking, noneSelected }

// Function def to use to define a persons fav hobby
typedef OnFavHobbySelected = void Function(String, Hobby);

// Simple widget to demo VoidCallback
class SomeWidget extends StatelessWidget {
  const SomeWidget({required this.onTap, Key? key}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onTap, child: const Text('SomeWidget'));
  }
}

// Da ViewModel
class Sdbx3ScreenViewModel extends BaseViewModel {
  Sdbx3ScreenViewModel();

  final people = {
    Person(id: 'idbob', label: 'Bob'),
    Person(id: 'idfred', label: 'Fred'),
    Person(id: 'idstan', label: 'Stan'),
  };

  final favHobby = <String, Hobby>{};

  void onSomeTap() {
    print('tapped! ${DateTime.now().toIso8601String()}');
  }

  void onFavHobbySelected(String id, Hobby hobby) {
    print('hobby tapped $id $hobby');
    favHobby[id] = hobby;
    notifyListeners();
  }

  Hobby getFavHobby(String id) => favHobby[id] ?? Hobby.noneSelected;
}

// Da screen
class Sdbx3Screen extends StatelessWidget {
  const Sdbx3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<Sdbx3ScreenViewModel>(builder: (_, viewModel, __) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sdbx3')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SomeWidget(onTap: viewModel.onSomeTap),
              vertical8,
              ...viewModel.people.map(
                (person) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: HobbiesList(
                    id: person.id,
                    label: person.label,
                    onHobbyResponse: viewModel.onFavHobbySelected,
                    selectedHobby: viewModel.getFavHobby(person.id),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class HobbiesList extends StatelessWidget {
  const HobbiesList({
    required this.id,
    required this.label,
    required this.onHobbyResponse,
    required this.selectedHobby,
    super.key,
  });

  final String id;
  final String label;
  final OnFavHobbySelected onHobbyResponse;
  final Hobby selectedHobby;

  @override
  Widget build(BuildContext context) {
    return OutlineBox(
      title: label,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...Hobby.values.map(
              (hobby) => hobby == Hobby.noneSelected
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: HobbyWidget(
                        id: id,
                        thisHobby: hobby,
                        onHobbyResponse: onHobbyResponse,
                        selectedHobby: selectedHobby,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class HobbyWidget extends StatelessWidget {
  const HobbyWidget({
    required this.id,
    required this.thisHobby,
    required this.onHobbyResponse,
    required this.selectedHobby,
    Key? key,
  }) : super(key: key);

  final String id;
  final Hobby thisHobby;
  final OnFavHobbySelected onHobbyResponse;
  final Hobby selectedHobby;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedHobby == thisHobby;

    final textColor = isSelected ? Colors.blue : Colors.black38;
    final fontWeight = isSelected ? FontWeight.bold : FontWeight.normal;
    final buttonOutline = isSelected ? Colors.blue : Colors.black38;
    final outlineWidth = isSelected ? 2.0 : 1.0;

    return OutlinedButton(
      onPressed: () => onHobbyResponse(id, thisHobby),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: outlineWidth, color: buttonOutline),
      ),
      child: Text(
        thisHobby.name,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class OutlineBox extends StatelessWidget {
  const OutlineBox({
    required this.title,
    required this.child,
    super.key,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 10,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 20, right: 8, bottom: 12),
          child: child,
        )
      ],
    );
  }
}
