require 'formula'

class Avrdude < Formula
  url 'http://download.savannah.gnu.org/releases/avrdude/avrdude-5.11.1.tar.gz'
  homepage 'http://savannah.nongnu.org/projects/avrdude/'
  md5 '3a43e288cb32916703b6945e3f260df9'

  depends_on 'libusb-compat' if ARGV.include? '--with-usb'

  def options
    [['--with-usb', 'Compile AVRDUDE with USB support.']]
  end

  def patches
    # Reduce usb_bulk_read timeout.
    { :p2 => "https://github.com/neonquill/avrdude/commit/b0d39fea608464a599cc2087ed18f0b5159ad8c5.diff"}
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
