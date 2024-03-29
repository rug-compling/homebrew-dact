class PatchedDbxml < Formula
  desc "Embeddable XML database with XQuery support and other advanced features"
  homepage "https://www.oracle.com/us/products/database/berkeley-db/xml/overview/index.html"
  url "http://download.oracle.com/berkeley-db/dbxml-6.1.4.tar.gz"
  sha256 "a8fc8f5e0c3b6e42741fa4dfc3b878c982ff8f5e5f14843f6a7e20d22e64251a"
  revision 1

  depends_on "berkeley-db"
  depends_on "xerces-c"
  depends_on "xqilla"

  # No public bug tracker or mailing list to submit this to, unfortunately.
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/4d337833ef2e10c1f06a72170f22b1cafe2b6a78/dbxml/c%2B%2B11.patch"
    sha256 "98d518934072d86c15780f10ceee493ca34bba5bc788fd9db1981a78234b0dc4"
  end

  patch do
    url "https://gist.githubusercontent.com/danieldk/cc956c669af2621a4d3ab3d0f40455ee/raw/35e0edc3dbcccbe1fe61db627f21798793d0fd0c/incorrect-optimization.patch"
    sha256 "4d4160552b22fc189aeb3f7ed60f5240d2f8ed3ffc9887ac65c03a2331c06d8c"
  end

  def install
    ENV.cxx11

    inreplace "dbxml/configure" do |s|
      # Static libraries are not included anymore. Libraries have symlinks
      # for major versions, avoid finding multiple versions (a homebrew
      # prefix only contains one version anyway).
      s.gsub! "lib/libdb-*.la | sed -e 's\/.*db-\\\(.*\\\).la", "lib/libdb-*.dylib | head -n1 | sed -e 's/.*db-\\(.*\\).dylib"
      s.gsub! "lib/libdb-*.la", "lib/libdb-*.dylib"
      s.gsub! "libz.a", "libz.dylib"
    end

    cd "dbxml" do
      system "./configure", "--disable-debug",
                            "--disable-dependency-tracking",
                            "--prefix=#{prefix}",
                            "--with-xqilla=#{Formula["xqilla"].opt_prefix}",
                            "--with-xerces=#{Formula["xerces-c"].opt_prefix}",
                            "--with-berkeleydb=#{Formula["berkeley-db"].opt_prefix}"
      system "make", "install"
    end
  end

  test do
    (testpath/"simple.xml").write <<~EOS
      <breakfast_menu>
        <food>
          <name>Belgian Waffles</name>
          <calories>650</calories>
        </food>
        <food>
          <name>Homestyle Breakfast</name>
          <calories>950</calories>
        </food>
      </breakfast_menu>
    EOS

    (testpath/"dbxml.script").write <<~EOS
      createContainer ""
      putDocument simple "simple.xml" f
      cquery 'sum(//food/calories)'
      print
      quit
    EOS
    assert_equal "1600", shell_output("#{bin}/dbxml -s #{testpath}/dbxml.script").chomp
  end
end
