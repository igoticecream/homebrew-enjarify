class Enjarify < Formula
  desc "Enjarify is a tool for translating Dalvik bytecode to equivalent Java bytecode"
  homepage "https://github.com/google/enjarify"
  url "https://github.com/google/enjarify/archive/1.0.3.tar.gz"
  sha256 "32a5e49104e616b359042ec287a622eff645ac3589505497117956446a0f88bd"

  depends_on "python3"

  def install
    # Install files
    bin.install "enjarify"
    bin.install "enjarify.sh"

    # Fix for OSX
    IO.write(bin/"enjarify.sh",
      File.open(bin/"enjarify.sh") do |f|
        f.read.gsub("readlink", "greadlink -f")
      end
    )
  end

end
