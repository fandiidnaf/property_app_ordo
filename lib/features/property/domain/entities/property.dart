class Property {
  Property({
    required this.property,
  });

  final List<PropertyElement> property;

  // factory Property.fromJson(Map<String, dynamic> json) {
  //   return Property(
  //     property: json["property"] == null
  //         ? []
  //         : List<PropertyElement>.from(
  //             json["property"]!.map((x) => PropertyElement.fromJson(x))),
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       "property": property.map((x) => x.toJson()).toList(),
  //     };
}

class PropertyElement {
  PropertyElement({
    required this.id,
    required this.name,
    required this.location,
    required this.img,
    required this.deadlines,
    required this.price,
    required this.propertyType,
    required this.transaction,
    required this.currentDate,
    required this.fine,
  });

  final String? id;
  final String? name;
  final String? location;
  final String? img;
  final DateTime? deadlines;
  final double? price;
  final String? propertyType;
  final Transaction? transaction;
  final DateTime? currentDate;
  final double? fine;

  factory PropertyElement.fromJson(Map<String, dynamic> json) {
    return PropertyElement(
      id: json["id"],
      name: json["name"],
      location: json["location"],
      img: json["img"],
      deadlines: DateTime.tryParse(json["deadlines"] ?? ""),
      price: json["price"],
      propertyType: json["property_type"],
      transaction: json["transaction"] == null
          ? null
          : Transaction.fromJson(json["transaction"]),
      currentDate: DateTime.tryParse(json["current_date"] ?? ""),
      fine: json["fine"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "img": img,
        "deadlines": deadlines?.toIso8601String(),
        "price": price,
        "property_type": propertyType,
        "transaction": transaction?.toJson(),
        "current_date": currentDate?.toIso8601String(),
        "fine": fine,
      };
}

class Transaction {
  Transaction({
    required this.tahapPemesanan,
    required this.tahapAdministrasi,
    required this.tahapPembangunan,
    required this.tahapAkadSerahTerima,
  });

  final TahapPemesanan? tahapPemesanan;
  final TahapAdministrasi? tahapAdministrasi;
  final TahapPembangunan? tahapPembangunan;
  final TahapAkadSerahTerima? tahapAkadSerahTerima;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      tahapPemesanan: json["tahap_pemesanan"] == null
          ? null
          : TahapPemesanan.fromJson(json["tahap_pemesanan"]),
      tahapAdministrasi: json["tahap_administrasi"] == null
          ? null
          : TahapAdministrasi.fromJson(json["tahap_administrasi"]),
      tahapPembangunan: json["tahap_pembangunan"] == null
          ? null
          : TahapPembangunan.fromJson(json["tahap_pembangunan"]),
      tahapAkadSerahTerima: json["tahap_akad_serah_terima"] == null
          ? null
          : TahapAkadSerahTerima.fromJson(json["tahap_akad_serah_terima"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "tahap_pemesanan": tahapPemesanan?.toJson(),
        "tahap_administrasi": tahapAdministrasi?.toJson(),
        "tahap_pembangunan": tahapPembangunan?.toJson(),
        "tahap_akad_serah_terima": tahapAkadSerahTerima?.toJson(),
      };
}

class TahapAdministrasi {
  TahapAdministrasi({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapAdministrasiMenu? menu;

  factory TahapAdministrasi.fromJson(Map<String, dynamic> json) {
    return TahapAdministrasi(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapAdministrasiMenu.fromJson(json["menu"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "progress": progress,
        "menu": menu?.toJson(),
      };
}

class TahapAdministrasiMenu {
  TahapAdministrasiMenu({
    required this.tahapSps,
    required this.tahapSpr,
    required this.tahapPpjb,
    required this.daftarDokumen,
    required this.tahapSp3K,
    required this.bayarAngsuran,
  });

  final bool? tahapSps;
  final bool? tahapSpr;
  final bool? tahapPpjb;
  final bool? daftarDokumen;
  final bool? tahapSp3K;
  final bool? bayarAngsuran;

  factory TahapAdministrasiMenu.fromJson(Map<String, dynamic> json) {
    return TahapAdministrasiMenu(
      tahapSps: json["tahap_sps"],
      tahapSpr: json["tahap_spr"],
      tahapPpjb: json["tahap_ppjb"],
      daftarDokumen: json["daftar_dokumen"],
      tahapSp3K: json["tahap_sp3k"],
      bayarAngsuran: json["bayar_angsuran"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tahap_sps": tahapSps,
        "tahap_spr": tahapSpr,
        "tahap_ppjb": tahapPpjb,
        "daftar_dokumen": daftarDokumen,
        "tahap_sp3k": tahapSp3K,
        "bayar_angsuran": bayarAngsuran,
      };
}

class TahapAkadSerahTerima {
  TahapAkadSerahTerima({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapAkadSerahTerimaMenu? menu;

  factory TahapAkadSerahTerima.fromJson(Map<String, dynamic> json) {
    return TahapAkadSerahTerima(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapAkadSerahTerimaMenu.fromJson(json["menu"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "progress": progress,
        "menu": menu?.toJson(),
      };
}

class TahapAkadSerahTerimaMenu {
  TahapAkadSerahTerimaMenu({
    required this.tahapAkad,
    required this.tahapSerahTerimaBangunan,
    required this.tahapSerahTerimaLegalitas,
    required this.daftarKomplain,
  });

  final bool? tahapAkad;
  final bool? tahapSerahTerimaBangunan;
  final bool? tahapSerahTerimaLegalitas;
  final bool? daftarKomplain;

  factory TahapAkadSerahTerimaMenu.fromJson(Map<String, dynamic> json) {
    return TahapAkadSerahTerimaMenu(
      tahapAkad: json["tahap_akad"],
      tahapSerahTerimaBangunan: json["tahap_serah_terima_bangunan"],
      tahapSerahTerimaLegalitas: json["tahap_serah_terima_legalitas"],
      daftarKomplain: json["daftar_komplain"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tahap_akad": tahapAkad,
        "tahap_serah_terima_bangunan": tahapSerahTerimaBangunan,
        "tahap_serah_terima_legalitas": tahapSerahTerimaLegalitas,
        "daftar_komplain": daftarKomplain,
      };
}

class TahapPembangunan {
  TahapPembangunan({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapPembangunanMenu? menu;

  factory TahapPembangunan.fromJson(Map<String, dynamic> json) {
    return TahapPembangunan(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapPembangunanMenu.fromJson(json["menu"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "progress": progress,
        "menu": menu?.toJson(),
      };
}

class TahapPembangunanMenu {
  TahapPembangunanMenu({
    required this.tahapPersiapan,
    required this.tahapPondasiStruktur,
    required this.tahapRumahUnfinished,
    required this.daftarFinishingInterior,
    required this.tahapPembersihan,
  });

  final double? tahapPersiapan;
  final double? tahapPondasiStruktur;
  final double? tahapRumahUnfinished;
  final double? daftarFinishingInterior;
  final double? tahapPembersihan;

  factory TahapPembangunanMenu.fromJson(Map<String, dynamic> json) {
    return TahapPembangunanMenu(
      tahapPersiapan: json["tahap_persiapan"],
      tahapPondasiStruktur: json["tahap_pondasi_struktur"],
      tahapRumahUnfinished: json["tahap_rumah_unfinished"],
      daftarFinishingInterior: json["daftar_finishing_interior"],
      tahapPembersihan: json["tahap_pembersihan"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tahap_persiapan": tahapPersiapan,
        "tahap_pondasi_struktur": tahapPondasiStruktur,
        "tahap_rumah_unfinished": tahapRumahUnfinished,
        "daftar_finishing_interior": daftarFinishingInterior,
        "tahap_pembersihan": tahapPembersihan,
      };
}

class TahapPemesanan {
  TahapPemesanan({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapPemesananMenu? menu;

  factory TahapPemesanan.fromJson(Map<String, dynamic> json) {
    return TahapPemesanan(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapPemesananMenu.fromJson(json["menu"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "progress": progress,
        "menu": menu?.toJson(),
      };
}

class TahapPemesananMenu {
  TahapPemesananMenu({
    required this.bookingFee,
    required this.pesananBelumBayar,
    required this.riwayatPemesanan,
  });

  final int? bookingFee;
  final bool? pesananBelumBayar;
  final bool? riwayatPemesanan;

  factory TahapPemesananMenu.fromJson(Map<String, dynamic> json) {
    return TahapPemesananMenu(
      bookingFee: json["booking_fee"],
      pesananBelumBayar: json["pesanan_belum_bayar"],
      riwayatPemesanan: json["riwayat_pemesanan"],
    );
  }

  Map<String, dynamic> toJson() => {
        "booking_fee": bookingFee,
        "pesanan_belum_bayar": pesananBelumBayar,
        "riwayat_pemesanan": riwayatPemesanan,
      };
}
