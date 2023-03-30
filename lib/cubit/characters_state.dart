part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {
  const CharactersState();
}

class CharactersInitialState extends CharactersState {
  const CharactersInitialState();
}

class CharactersLoadingState extends CharactersState {
  const CharactersLoadingState();
}



class CharactersLoadedState extends CharactersState {
  const CharactersLoadedState({required this.listCharacters});
  final List<CharacterModel> listCharacters;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CharactersLoadedState && other.listCharacters == listCharacters;
  }

  @override
  int get hashCode => listCharacters.hashCode;
}

class CharactersErrorState extends CharactersState {
  final String message;
  const CharactersErrorState({required this.message});
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersErrorState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}