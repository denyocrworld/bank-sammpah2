part of '../pages.dart';

class DetailRiwayat extends StatefulWidget {
  const DetailRiwayat({super.key});

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        title: const Text('Detail Riwayat',
            style: TextStyle(
                color: Color(0xFF001F29), fontWeight: FontWeight.w500)),
        leading: GestureDetector(
          onTap: () {
            context.go('/RiwayatScreen');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: BlocBuilder<DetalHistoryCubit, DetalHistoryState>(
        builder: (context, detalHistoryState) {
          if (detalHistoryState is DetalHistoryIsSuccess) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat Penjemputan",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFA7ABB3),
                          ),
                          Text(
                            '${detalHistoryState.data.pickup_address}',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Tanggal Penjemputan",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.date_range, color: Color(0xFFA7ABB3)),
                          Text(
                            "${detalHistoryState.data.date}",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          "Berat Sampah:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${detalHistoryState.data.weight}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "kg",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Waktu",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 2) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '00',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 6),
                          child: Text(
                            ":",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 6),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 2) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '00',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            value: "AM",
                            groupValue: groupValue,
                            title: const Text("AM"),
                            controlAffinity: ListTileControlAffinity.platform,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 20),
                      child: Container(
                        height: 125.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${detalHistoryState.data.image}"),
                              fit: BoxFit.fill),
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              "Total Biaya",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Rp. ${detalHistoryState.data.price}",
                                style: TextStyle(
                                    fontSize: 22.0, color: Color(0xFF019BF1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (detalHistoryState is DetalHistoryIsLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Text(
              "Kosong",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
