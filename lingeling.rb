require 'formula'

class Lingeling < Formula
  homepage 'http://fmv.jku.at/lingeling/'
  url 'http://fmv.jku.at/lingeling/lingeling-bal-2293bef-151109.tar.gz'
  sha1 '7df653fb3eb400c6028b571e6514210e57b53f81'

  # option 'with-variants', 'Install other variants as well'

  # depends_on 'lingeling-druplig' if build.with? 'variants'
  # depends_on 'plingeling' if build.with? 'variants'
  # depends_on 'treengeling' if build.with? 'variants'

  def install
    system "./configure.sh -O"
    system "make lingeling"
    bin.install "lingeling"
    lib.install "liblgl.a"
    (include/'lingeling').install "lgldimacs.h", "lglib.h"
  end

end
