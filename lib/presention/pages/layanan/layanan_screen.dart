// ignore_for_file: prefer_const_constructors

part of '../pages.dart';

class LayananScreen extends StatefulWidget {
  const LayananScreen({super.key});

  @override
  State<LayananScreen> createState() => _LayananScreenState();
}

class _LayananScreenState extends State<LayananScreen>
    with WidgetsBindingObserver {
  List<String> image = [
    "asset/images/langganan.png",
    "asset/images/hajatan.png",
    "asset/images/sekali_angkut.png",
    "asset/images/acara_lainnya.png",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("APP_STATE: $state");

    if (state == AppLifecycleState.inactive) {
      // user returned to our app
      const LayananScreen();
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user quit our app temporally
    } else if (state == AppLifecycleState.resumed) {
      // app suspended
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Layanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              context.goNamed(Routes.NavigasiBar);
            },
            child: const Icon(CupertinoIcons.arrow_left, color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body:
          BlocConsumer<LayananCubit, LayananState>(listener: (context, state) {
        if (state is LayananIsError) {
          return Commons().showSnackbarInfo(context, "Data Not Found");
        }
      }, builder: (context, state) {
        if (state is LayananIsLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else if (state is LayananIsSuccess) {
          return ListView.builder(
            itemCount: state.data.pick_up.length,
            itemBuilder: (context, index) {
              final data = state.data.pick_up[index];
              final imageList = image[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: Colors.blue.shade50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context.goNamed(
                                    Routes.PenjemputanScreen,
                                    extra: data.layanan,
                                  );
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffCEE5FF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Image(image: AssetImage(imageList)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          data.layanan,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Container();
      }),
    );
  }
}
