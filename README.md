# AMD Yellow Carp ACP6x DMIC Machine Driver (`snd-soc-acp6x-mach`)

[Bahasa Indonesia](#bahasa-indonesia) | [English](#english)

---

## Bahasa Indonesia

Driver kernel (machine driver) ini menambahkan dukungan Digital Microphone (DMIC) untuk platform **AMD Yellow Carp (ACP6x)** pada ALSA (Advanced Linux Sound Architecture) / System on Chip (ASoC).

Banyak laptop modern bertenaga AMD Ryzen (Seri 6000/7000/8000) yang memerlukan entri DMI Quirk tertentu agar mikrofon internal (DMIC) terdeteksi dan berfungsi dengan benar di Linux.

### 📋 Prasyarat

Sebelum melakukan kompilasi atau pemasangan, pastikan sistem Anda telah terpasang:
- Linux Kernel headers untuk kernel yang sedang aktif (`linux-headers-$(uname -r)` pada Debian/Ubuntu atau `kernel-devel` pada Fedora/RHEL/Arch).
- Toolchain pengembangan standar (`make`, `gcc`).
- `dkms` (Opsional, sangat direkomendasikan jika ingin modul terkompilasi ulang secara otomatis saat terjadi pembaruan kernel).

### 🚀 Cara Pemasangan

#### Metode 1: Menggunakan DKMS (Direkomendasikan)
Pemasangan melalui DKMS akan secara otomatis membangun ulang modul driver setiap kali kernel Linux diperbarui.

```bash
sudo make dkms_install
```

#### Metode 2: Pemasangan Manual (Kernel Aktif)
Jika Anda tidak menggunakan DKMS, Anda dapat mengompilasi dan memasang modul secara langsung ke kernel yang sedang berjalan:

```bash
# Kompilasi modul
make

# Pasang modul ke kernel aktif
sudo make install
```

Setelah pemasangan, muat modul kernel atau lakukan *reboot*:
```bash
sudo modprobe snd-soc-acp6x-mach
```

### 🗑️ Cara Menghapus (Uninstall)

#### Menggunakan DKMS:
```bash
sudo make dkms_uninstall
```

#### Manual:
Hapus berkas `.ko` dari `/lib/modules/$(uname -r)/` dan jalankan `sudo depmod -a`.

### 💻 Perangkat yang Didukung (DMI Quirk List)
Driver ini menyertakan entri DMI untuk berbagai model laptop dari produsen seperti:
- **Acer** (Aspire, Nitro series)
- **ASUS** (Vivobook, ExpertBook, ZenBook series)
- **Dell / Alienware** (Dell G15, Alienware m15/m17)
- **HP** (Victus, OMEN, HP Laptop series)
- **Lenovo** (ThinkPad, IdeaPad, Legion series)
- **MSI** (Bravo, Thin, Vector, Raider series)
- **Razer, Xiaomi/Redmi, System76, MECHREVO, IRBIS, dll.**

---

## English

This kernel machine driver provides Digital Microphone (DMIC) support for the **AMD Yellow Carp (ACP6x)** platform in the Advanced Linux Sound Architecture (ALSA) / ASoC subsystem.

Many modern AMD Ryzen-powered laptops (6000/7000/8000 series) require specific DMI quirk table entries for their internal digital microphones (DMIC) to be properly recognized and functional under Linux.

### 📋 Prerequisites

Before compiling or installing, ensure your system has the following installed:
- Kernel headers matching your current running kernel (`linux-headers-$(uname -r)` on Debian/Ubuntu, or `kernel-devel` on Fedora/RHEL/Arch).
- Standard build tools (`make`, `gcc`).
- `dkms` (Optional, recommended to automatically rebuild the module upon kernel updates).

### 🚀 Installation

#### Method 1: Using DKMS (Recommended)
Installing via DKMS ensures that the driver module is automatically rebuilt whenever your Linux kernel updates.

```bash
sudo make dkms_install
```

#### Method 2: Manual Installation (Active Kernel)
If you prefer not to use DKMS, you can build and install the module directly for your currently running kernel:

```bash
# Build the module
make

# Install to the active kernel
sudo make install
```

After installation, load the kernel module or reboot your machine:
```bash
sudo modprobe snd-soc-acp6x-mach
```

### 🗑️ Uninstallation

#### Using DKMS:
```bash
sudo make dkms_uninstall
```

#### Manual:
Remove the compiled `.ko` module file from `/lib/modules/$(uname -r)/` and run `sudo depmod -a`.

### 💻 Supported Devices
This driver includes DMI quirk entries for multiple laptop models across vendors, including:
- **Acer** (Aspire, Nitro series)
- **ASUS** (Vivobook, ExpertBook, ZenBook series)
- **Dell / Alienware** (Dell G15, Alienware m15/m17)
- **HP** (Victus, OMEN, HP Laptop series)
- **Lenovo** (ThinkPad, IdeaPad, Legion series)
- **MSI** (Bravo, Thin, Vector, Raider series)
- **Razer, Xiaomi/Redmi, System76, MECHREVO, IRBIS, etc.**

---

## 📄 License

This project is licensed under the [GNU General Public License v2.0](LICENSE) (SPDX: GPL-2.0-only).
