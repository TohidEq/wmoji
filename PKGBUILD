# Maintainer: Tohid Eq [TohidEq@gmail.com](mailto:TohidEq@gmail.com)

pkgname=wmoji
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal emoji picker for Wayland using wmenu"
arch=('any')
url="https://github.com/TohidEq/wmoji"
license=('MIT')
depends=('wmenu' 'wl-clipboard' 'libnotify' 'curl' 'jq')

source=()
sha256sums=()

package() {
cd "$startdir"


install -d "$pkgdir/usr/lib/wmoji"
install -d "$pkgdir/usr/bin"
install -d "$pkgdir/usr/share/licenses/$pkgname"
install -d "$pkgdir/usr/share/doc/$pkgname"

install -Dm755 src/wmoji \
    "$pkgdir/usr/lib/wmoji/wmoji"

install -Dm755 src/build-items.sh \
    "$pkgdir/usr/lib/wmoji/build-items.sh"

install -Dm755 src/update-emojis.sh \
    "$pkgdir/usr/lib/wmoji/update-emojis.sh"

ln -s /usr/lib/wmoji/wmoji \
    "$pkgdir/usr/bin/wmoji"

install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

install -Dm644 wmoji-default.conf \
    "$pkgdir/usr/share/doc/$pkgname/wmoji-default.conf"


}
