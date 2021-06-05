class Sgtsnepi < Formula
  desc "Swift Neighbor Embedding of Sparse Stochastic Graphs"
  url "https://github.com/fcdimitr/sgtsnepi.git",
      tag: "v1.0.2"
  license "GPL-3.0"

  depends_on "gcc@7" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build # maybe
  depends_on "flann" => :build
  depends_on "tbb" => :build
  depends_on "metis" => :build
  depends_on "fftw" => :build
  depends_on "lz4" => :build
  depends_on "doxygen" => :build


  def install
    ENV['CC'] = '/usr/local/bin/g++-7'
    ENV['LD'] = '/usr/local/bin/g++-7'
    ENV['CXX'] = '/usr/local/bin/g++-7'
    ENV['CPLUS_INCLUDE_PATH'] = "#{Formula["metis"].opt_include}:#{Formula["tbb"].opt_include}:#{Formula["lz4"].opt_include}"
    ENV['LIBRARY_PATH'] = "#{Formula["metis"].opt_lib}:#{Formula["tbb"].opt_lib}:#{Formula["lz4"].opt_lib}"
    mkdir "build" do
      system "meson", *std_meson_args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end
end
