# Maintainer: AYASCELL <https://github.com/AYASCELL>
pkgname=vi3ecode-bin
_pkgname=vi3ecode
pkgver=0.4.6
pkgrel=1
pkgdesc="Vi3ecode - Multi-Agent Orchestration Desktop Application"
arch=('x86_64')
url="https://vi3ecode.com/"
license=('custom')
depends=('fuse2' 'glibc' 'hicolor-icon-theme')
provides=('vi3ecode')
conflicts=('vi3ecode')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-src.tar.zst::https://github.com/AYASCELL/vi3ecode-arch/releases/download/x86_64/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e1bddfcf91642e9d30a1e6b06bc11b213d51d89cc9a1f3002d96226afe84d31f')

package() {
    cp -dr --no-preserve=ownership "${srcdir}/opt" "${srcdir}/usr" "${pkgdir}/"
}
