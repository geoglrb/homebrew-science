require 'formula'

class ClustalW < Formula
  homepage 'http://www.clustal.org/clustal2/'
  url 'http://www.clustal.org/download/2.1/clustalw-2.1.tar.gz'
  sha1 'f29784f68585544baa77cbeca6392e533d4cf433'

  fails_with :clang do
    build 503
    cause "error: implicit instantiation of undefined template"
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/clustalw2 --version 2>&1 |grep CLUSTAL"
  end
end
