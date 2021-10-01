# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.0.0"
  license "Apache-2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.0.0/spicedb_1.0.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "caab29d2e33ee8b3645c294c72f906a2e666bffd072a360bc4285bc4ed05ac44"
    end
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.0.0/spicedb_1.0.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "e23653f880f4dfba8a01ff6137084765dd205bb13b6e7bde2a5a34d96a69cb61"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.0.0/spicedb_1.0.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "19e9e605904da53f644f68d121d33d5fa6015432a2ebda8b877d34f449af801d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.0.0/spicedb_1.0.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "8aa3f8d6b74ce86d8e7240d415e6e03969444f0a5030c44b01f589c7ff1111c2"
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  depends_on "go" => :build

  def install
    if !File.exists? "spicedb"
      system "go build --ldflags \"-s -w -X github.com/authzed/spicedb/internal/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/spicedb"
    end
    bin.install "spicedb"
  end

  test do
    system "#{bin}/spicedb version"
  end
end