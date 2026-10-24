# Vi3ecode Arch Linux Paket Deposu (`vi3ecode-bin`)

Bu depo, **[Vi3ecode](https://vi3ecode.com/)** (Multi-Agent Orchestration Desktop Application) yazılımını Arch Linux ve tabanlı dağıtımlarda (`Arch`, `CachyOS`, `EndeavourOS`, `Manjaro`, `Garuda` vb.) **`pacman`**, **`yay`** veya **`paru`** ile doğrudan kurabilmeniz ve güncelleyebilmeniz için yeniden paketlenmiş (repackaged) gayriresmi Arch Linux paket deposudur.

> [!NOTE]
> **Yasal Uyarı / Bilgilendirme:** Bu depo resmi bir Vi3ecode deposu değildir. Resmi **Vi3ecode** ([https://vi3ecode.com/](https://vi3ecode.com/)) masaüstü uygulamasının hiçbir değişikliğe uğramadan Arch Linux paket sistemine (`pacman`) uyarlanmış ve yeniden paketlenmiş halidir. Yazılımın kendisi, markası ve tüm telif/lisans hakları **[Vi3ecode](https://vi3ecode.com/)** ekibine aittir.

---

## 1. Tek Komutla Kurulum (Önerilen)

Aşağıdaki komut `/etc/pacman.conf` dosyanıza `[vi3ecode]` deposunu otomatik olarak ekler ve `vi3ecode-bin` paketini kurar:

```bash
curl -fsSL https://raw.githubusercontent.com/AYASCELL/vi3ecode-arch/main/setup-repo.sh | sudo bash
```

---

## 2. Manuel Depo Ekleyerek Kurulum (`pacman` / `yay` / `paru`)

### Adım 1: Depoyu `/etc/pacman.conf` Dosyasına Ekleyin
`/etc/pacman.conf` dosyasının en altına aşağıdaki satırları ekleyin:

```ini
[vi3ecode]
SigLevel = Optional TrustAll
Server = https://github.com/AYASCELL/vi3ecode-arch/releases/download/x86_64
```

Tek satırlık komutla eklemek isterseniz:
```bash
echo -e '\n[vi3ecode]\nSigLevel = Optional TrustAll\nServer = https://github.com/AYASCELL/vi3ecode-arch/releases/download/x86_64' | sudo tee -a /etc/pacman.conf
```

### Adım 2: Paketi Kurun
Depoyu ekledikten sonra tercih ettiğiniz paket yöneticisiyle kurabilirsiniz:

```bash
# Pacman ile:
sudo pacman -Syu vi3ecode-bin

# Yay ile:
yay -Syu vi3ecode-bin

# Paru ile:
paru -Syu vi3ecode-bin
```
*(Not: Paket `provides=('vi3ecode')` tanımladığı için `sudo pacman -S vi3ecode` komutu da doğrudan çalışır.)*

---

## 3. Depo Eklemeden Tek Seferlik Kurulum (`pacman -U` / `makepkg`)

`/etc/pacman.conf` dosyasına depo eklemeden doğrudan GitHub üzerinden kurmak isterseniz:

```bash
sudo pacman -U https://github.com/AYASCELL/vi3ecode-arch/releases/download/x86_64/vi3ecode-bin-0.4.6-1-x86_64.pkg.tar.zst
```

Veya depoyu klonlayıp `makepkg` ile:
```bash
git clone https://github.com/AYASCELL/vi3ecode-arch.git
cd vi3ecode-arch
makepkg -si
```
