class Sgtsnepi < Formula
  desc "Swift Neighbor Embedding of Sparse Stochastic Graphs"
  url "https://github.com/fcdimitr/sgtsnepi.git",
      tag: "v1.0.2-julia-python"
  license "GPL-3.0"

  depends_on "gcc@7" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build # maybe
  depends_on "fftw" => :build


  def install
    ENV['CC'] = '/usr/local/bin/g++-7'
    ENV['LD'] = '/usr/local/bin/g++-7'
    ENV['CXX'] = '/usr/local/bin/g++-7'
    mkdir "build" do
      system "meson", *std_meson_args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end
end
