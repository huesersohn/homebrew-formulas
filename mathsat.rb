require 'formula'

class Mathsat < Formula
  homepage 'http://mathsat.fbk.eu/index.html'
  url 'http://mathsat.fbk.eu/download.php?file=mathsat-5.3.10-darwin-libcxx-x86_64.tar.gz'
  version '5.3.10'
  sha1 '7df0b619e04a650ceb1e6669d04e0eb7b64b59be'

  depends_on :python
  depends_on 'gmp'

  def install
    pyver = `python --version 2>&1 | awk '{print $2}'`.chomp.gsub(/([0-9]+).([0-9]+).([0-9]+)/, '\1.\2')
    pylocal = (lib/"python#{pyver}/site-packages")

    # Compile python bindings.
    Dir.chdir 'python' do
      system "python setup.py build"
    end

    # Install.
    bin.install 'bin/mathsat'
    include.install 'include/mathsat.h'
    lib.install 'lib/libmathsat.a'
    (share/'mathsat').install 'configurations', 'examples'
    mkdir_p "#{pylocal}"
    pylocal.install "python/mathsat.py", Dir["python/build/lib*/_mathsat.so"]
  end
end
