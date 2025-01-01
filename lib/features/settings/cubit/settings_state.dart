import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final String email;
  final String phoneNumber;

  const SettingsState({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.email,
    required this.phoneNumber,
  });

  SettingsState copyWith({
    String? name,
    DateTime? dateOfBirth,
    String? gender,
    String? email,
    String? phoneNumber,
  }) {
    return SettingsState(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [name, dateOfBirth, gender, email, phoneNumber];
}
