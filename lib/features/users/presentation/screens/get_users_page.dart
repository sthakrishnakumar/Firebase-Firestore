import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../commons/export.dart';

class GetUsersPage extends ConsumerStatefulWidget {
  const GetUsersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetUsersPageState();
}

class _GetUsersPageState extends ConsumerState<GetUsersPage> {
  @override
  Widget build(BuildContext context) {
    final getUsers = ref.watch(getUserNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
        centerTitle: true,
      ),
      body: AsyncValueWidget<List<GetUsersModel>>(
        value: getUsers,
        data: (d) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...d.map(
              (e) => Card(
                child: ListTile(
                  title: Text('${e.firstName} ${e.lastName}'),
                  subtitle: Text(e.email),
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(e.avatar),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
