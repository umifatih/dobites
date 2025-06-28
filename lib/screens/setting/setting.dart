import 'package:flutter/material.dart';
import 'personal_info_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xFFFCEDD6)), // background cream
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  _buildAppSettingsTitle(),
                  _buildSettingsCard(),
                  _buildOtherSectionTitle(),
                  _buildOtherCard(),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_pattern.png'),
          fit: BoxFit.cover,
          alignment: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // kembali ke home
                      },
                      child: Row(
                        children: [
                          Image.network(
                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/oeitp1hv_expires_30_days.png",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "Kembali",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Setting",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/nzytoann_expires_30_days.png",
                    width: 62,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Arion",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "arion@gmail.com",
                        style: TextStyle(
                          color: Color(0xFFE9EDF7),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/ln5880p2_expires_30_days.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSettingsTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 13, top: 16),
      child: Text(
        "Pengaturan Aplikasi",
        style: TextStyle(color: Color(0xFF2B4F6E), fontSize: 12),
      ),
    );
  }

  Widget _buildSettingsCard() {
    return _buildCard([
      _buildListTile(
        icon: Image.network(
          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/m3w2p9bi_expires_30_days.png",
          width: 33,
          height: 33,
        ),
        title: "Informasi Pribadi",
        subtitle: "Informasi akun kamu",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/7m605a4w_expires_30_days.png",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonalInfoPage()),
          );
        },
      ),

      _buildListTile(
        icon: Image.network(
          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/bebon9na_expires_30_days.png",
          width: 33,
          height: 33,
        ),
        title: "Notifikasi",
        subtitle: "Pengaturan pemberitahuan",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/3rng3uv7_expires_30_days.png",
      ),
      _buildListTile(
        icon: Image.network(
          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/h96zfdzs_expires_30_days.png",
          width: 33,
          height: 33,
        ),
        title: "Privasi",
        subtitle: "Kebijakan kami",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/fzi7djmv_expires_30_days.png",
      ),
      _buildListTile(
        icon: Image.network(
          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/wrjq0gvy_expires_30_days.png",
          width: 33,
          height: 33,
        ),
        title: "Ketentuan",
        subtitle: "Ketentuan Layanan kami",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/p49uwp5y_expires_30_days.png",
      ),
      _buildListTile(
        icon: Image.network(
          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/k76rl55f_expires_30_days.png",
          width: 33,
          height: 33,
        ),
        title: "Ganti Password",
        subtitle: "Atur kembali password akun",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/gvwxx8md_expires_30_days.png",
      ),
    ]);
  }

  Widget _buildOtherSectionTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 13, top: 24, bottom: 12),
      child: Text(
        "Lainnya",
        style: TextStyle(color: Color(0xFF2B4F6E), fontSize: 12),
      ),
    );
  }

  Widget _buildOtherCard() {
    return _buildCard([
      _buildListTile(
        icon: const Icon(
          Icons.help_outline,
          size: 33,
          color: Color(0xFF7B5347),
        ),
        title: "Bantuan",
        subtitle: "Pusat panduan pengguna",
        trailing:
            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/08oln73j_expires_30_days.png",
      ),
      _buildListTile(
        icon: const Icon(
          Icons.info_outline,
          size: 33,
          color: Color(0xFF7B5347),
        ),
        title: "Version",
        subtitle: "1.0.1",
        trailing: "",
      ),
    ]);
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: InkWell(
          onTap: () {
            print('Keluar ditekan');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 127),
            decoration: BoxDecoration(
              color: const Color(0xFF4B2C20),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Keluar",
                  style: TextStyle(
                    color: Color(0xFFF6F2ED),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 7),
                Image.network(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/0zcnr7il_expires_30_days.png",
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40000000),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile({
    required Widget icon,
    required String title,
    required String subtitle,
    required String trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF404040),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            if (trailing.isNotEmpty)
              Image.network(trailing, width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}
