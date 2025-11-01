import 'package:condin/features/auth/models/user.dart';
import 'package:condin/features/auth/repositories/auth_remote_repository.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel{
  late AuthRemoteRepository authRemoteRepository;

  @override
  AsyncValue<User>? build(){
    authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    return null;
  }

  Future<void> signUpUser({
    required String username,
    required String email,
    required String password
  }) async{
    state = const AsyncValue.loading();
    final res = await authRemoteRepository.signup(username: username, email: email, password: password);

    final val = switch(res){
      Left(value: final l) => state = AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r),
    };

    print(val);
  }
}