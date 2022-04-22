class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://files.pythonhosted.org/packages/6d/f1/4f76c9fcd58cce3619196d67b3f11a996da7610f34d73538b6c8af8f6353/you-get-0.4.1602.tar.gz"
  sha256 "4706c06cc4b9080ea93b4f13b9a4dbebb60cfe12d191c78e17b0fa895d17708f"
  license "MIT"
  head "https://github.com/soimort/you-get.git", branch: "develop"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e6b44337d222234585e6e3997f6d1660550893171979c3974db98f5ea5754abb"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e6b44337d222234585e6e3997f6d1660550893171979c3974db98f5ea5754abb"
    sha256 cellar: :any_skip_relocation, monterey:       "df0dc12c7442eba996568ba4308f522f1850d75a7434fdc891bcea339e9b65e6"
    sha256 cellar: :any_skip_relocation, big_sur:        "df0dc12c7442eba996568ba4308f522f1850d75a7434fdc891bcea339e9b65e6"
    sha256 cellar: :any_skip_relocation, catalina:       "df0dc12c7442eba996568ba4308f522f1850d75a7434fdc891bcea339e9b65e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "12c1736ef7aa5fd5450201f8640946d21eae71ca0eff2ea903c6ab38f4043784"
  end

  depends_on "python@3.10"
  depends_on "rtmpdump"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, run `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
