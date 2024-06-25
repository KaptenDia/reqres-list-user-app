import 'package:flutter/material.dart';
import 'package:list_users_app/module/user/provider/user_provider.dart';
import 'package:list_users_app/module/user/widget/shimmer_user_card.dart';
import 'package:list_users_app/module/user/widget/user_card.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<UserProvider>(context, listen: false);
    dataProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Tambah User',
        child: const Icon(Icons.add, color: Colors.blue, size: 28),
      ),
      body: dataProvider.isLoading
          ? Container(
              padding: const EdgeInsets.all(24),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ShimmerUserCard();
                  }),
            )
          : RefreshIndicator(
              onRefresh: () async {
                dataProvider.getUserData();
                setState(() {});
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              dataProvider.isSelected =
                                  !dataProvider.isSelected;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: dataProvider.isSelected == false
                                    ? Colors.grey[200]
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.list,
                                color: dataProvider.isSelected
                                    ? Colors.grey
                                    : Colors.blue,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              dataProvider.isSelected =
                                  !dataProvider.isSelected;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: dataProvider.isSelected
                                    ? Colors.grey[200]
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.grid_view_outlined,
                                color: dataProvider.isSelected
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ExpansionTile(
                          title: Text(dataProvider.isAscending ? 'A-Z' : 'Z-A'),
                          children: [
                            ListTile(
                              title: const Text('Sort Ascending (A-Z)'),
                              onTap: () {
                                dataProvider.isAscending = true;
                                setState(() {});
                                // Call method to sort data ascending
                                dataProvider.sortUserData(ascending: true);
                              },
                            ),
                            ListTile(
                              title: const Text('Sort Descending (Z-A)'),
                              onTap: () {
                                dataProvider.isAscending = false;
                                setState(() {});
                                // Call method to sort data descending
                                dataProvider.sortUserData(ascending: false);
                              },
                            ),
                          ],
                        ),
                      ),
                      dataProvider.isSelected == false
                          ? ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  dataProvider.dataUser.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                if (dataProvider.dataUser.data?.length ==
                                    null) {
                                  return const Center(child: Text('No Data'));
                                }
                                return UserCardWidget(
                                    name:
                                        '${dataProvider.dataUser.data?[index].firstName ?? '-'} ${dataProvider.dataUser.data?[index].lastName ?? '-'}',
                                    email: dataProvider
                                            .dataUser.data?[index].email ??
                                        '-',
                                    imageUrl: dataProvider
                                            .dataUser.data?[index].avatar ??
                                        '-');
                              })
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount:
                                  dataProvider.dataUser.data?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (dataProvider.dataUser.data?.length ==
                                    null) {
                                  return const Center(child: Text('No Data'));
                                }
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            dataProvider.dataUser.data?[index]
                                                    .avatar ??
                                                '-'),
                                        backgroundColor: Colors.grey,
                                        radius: 24,
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Text(
                                          '${dataProvider.dataUser.data?[index].firstName ?? '-'} ${dataProvider.dataUser.data?[index].lastName ?? '-'}'),
                                      Text(dataProvider
                                              .dataUser.data?[index].email ??
                                          '-'),
                                    ],
                                  ),
                                );
                              }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
