
void main() {
  // 1. Daftar menu minimal 8 item
  List<Map<String, dynamic>> menu = [
    {'nama': 'Nasi Goreng', 'harga': 15000},
    {'nama': 'Mie Goreng', 'harga': 12000},
    {'nama': 'Ayam Geprek', 'harga': 18000},
    {'nama': 'Soto Ayam', 'harga': 15000},
    {'nama': 'Bakso', 'harga': 13000},
    {'nama': 'Nasi Uduk', 'harga': 10000},
    {'nama': 'Es Teh', 'harga': 5000},
    {'nama': 'Jus Jeruk', 'harga': 8000},
  ];

  // 2. Tampilkan menu menggunakan perulangan
  print('========== DAFTAR MENU ==========');
  for (int i = 0; i < menu.length; i++) {
    print(
      '${i + 1}. ${menu[i]['nama']} - ${rupiah(menu[i]['harga'])}',
    );
  }

  // 3. Daftar pesanan minimal 3 item berbeda
  List<Map<String, dynamic>> pesanan = [
    {'nama': 'Nasi Goreng', 'qty': 2, 'subtotal': 30000},
    {'nama': 'Ayam Geprek', 'qty': 2, 'subtotal': 36000},
    {'nama': 'Es Teh', 'qty': 3, 'subtotal': 15000},
  ];

  // 4. Hitung total belanja
  int total = 0;

  for (var item in pesanan) {
    total += item['subtotal'] as int;
  }

  // 5. Hitung diskon dan PPN
  double persenDiskon = total >= 100000
      ? 10
      : total >= 50000
          ? 5
          : 0;

  int diskon = hitungDiskon(total, persen: persenDiskon);
  int ppn = (total * 0.10).round();
  int totalBayar = total - diskon + ppn;

  // 6. Cetak struk
  cetakStruk(
    pesanan: pesanan,
    total: total,
    diskon: diskon,
    ppn: ppn,
    totalBayar: totalBayar,
  );
}

// Fungsi untuk format rupiah
String rupiah(int angka) {
  String teks = angka.toString();
  String hasil = '';

  for (int i = 0; i < teks.length; i++) {
    if (i > 0 && (teks.length - i) % 3 == 0) {
      hasil += '.';
    }
    hasil += teks[i];
  }

  return 'Rp $hasil';
}

// Fungsi pertama: menghitung diskon
int hitungDiskon(int total, {double persen = 0}) {
  return (total * persen / 100).round();
}

// Fungsi kedua: mencetak struk dengan parameter bernama
void cetakStruk({
  required List<Map<String, dynamic>> pesanan,
  required int total,
  required int diskon,
  required int ppn,
  required int totalBayar,
}) {
  print('\n');
  print('================================');
  print('          STRUK KASIR');
  print('================================');

  for (var item in pesanan) {
    print('${item['nama']} x${item['qty']}');
    print('  Subtotal: ${rupiah(item['subtotal'] as int)}');
  }

  print('--------------------------------');
  print('Total Belanja : ${rupiah(total)}');
  print('Diskon        : ${rupiah(diskon)}');
  print('PPN 10%       : ${rupiah(ppn)}');
  print('--------------------------------');
  print('TOTAL BAYAR   : ${rupiah(totalBayar)}');
  print('================================');
  print('       Terima kasih!');
}
